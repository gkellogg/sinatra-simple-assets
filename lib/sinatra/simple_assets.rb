require 'sinatra/base'

module Sinatra
  module SimpleAssets
    module Helpers
      def stylesheet(bundle)
        settings.assets.paths_for("#{bundle}.css").map do |file|
          "<link rel=\"stylesheet\" href=\"#{url(file)}\">"
        end.join("\n")
      end

      def javascript(bundle)
        settings.assets.paths_for("#{bundle}.js").map do |file|
          "<script src=\"#{url(file)}\"></script>"
        end.join("\n")
      end
    end

    class Bundle
      attr_accessor :files

      def initialize(name, type, root, files)
        @name = name
        @type = type
        @root = root
        @files = files
      end

      def name
        "#{@name}.#{@type}"
      end

      def hash_name
        "#{@name}-#{hash}.#{@type}"
      end

      def hashed_path
        "#{path}/#{hash_name}"
      end

      def hash
        @hash ||= begin
          Digest::SHA1.hexdigest content
        rescue
          # Find the most recent compressed version if the JS runtime is unavailable
          fname = Dir.glob("#{@root}/#{path}/#{@name}-*.#{@type}").sort_by {|f| File.mtime(f)}.last
          fname.split('-').last.sub(".#{@type}", "")
        end
      end

      def content
        case @type
        when :js
          require 'uglifier'
          @content ||= Uglifier.new.compress combined
        when :css
          require 'cssmin'
          @content ||= CSSMin.minify combined
        end
      end

      def combined
        @combined ||= @files.map do |file|
          File.open(@root + file) { |f| f.read }
        end.join("\n")
      end

      def path
        @type == :js ? 'javascripts' : 'stylesheets'
      end

      def compile
        File.open("#{@root}/#{hashed_path}", 'w') do |f|
          f << content
        end
      end
    end

    class Assets
      def initialize(app, &block)
        @app = app
        @bundles = {}
        @hashes = {}
        instance_eval(&block)
      end

      def css(bundle, files)
        create_bundle(bundle, :css, files)
      end

      def js(bundle, files)
        create_bundle(bundle, :js, files)
      end

      def create_bundle(name, type, files)
        bundle = Bundle.new(name, type, @app.public_folder, files)
        @bundles[bundle.name] = bundle
      end

      def paths_for(bundle)
        bundle = @bundles[bundle]
        return [] unless bundle

        if @app.environment == :production
          @hashes[bundle.hash_name] = bundle.name
          [bundle.hashed_path]
        else
          bundle.files
        end
      end

      def content_for(bundle)
        bundle = @bundles[@hashes[bundle]]
        bundle.content if bundle
      end

      def precompile
        @bundles.values.each do |bundle|
          bundle.compile
        end
      end

      def bundle_exists?(bundle)
        @hashes[bundle]
      end
    end

    def assets(&block)
      @assets ||= Assets.new(self, &block)
    end

    def self.registered(app)
      app.helpers SimpleAssets::Helpers

      [
        { :route => '/stylesheets', :type => :css },
        { :route => '/javascripts', :type => :js }
      ].each do |r|
        app.get "#{r[:route]}/:bundle" do
          bundle = params[:bundle]
          assets = settings.assets
          exists = assets.bundle_exists?(bundle)

          etag bundle if exists
          not_found unless exists

          cache_control :public, :must_revalidate, :max_age => 86400

          content_type r[:type]
          assets.content_for(bundle)
        end
      end
    end
  end

  register SimpleAssets
end
