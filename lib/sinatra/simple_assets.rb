require 'sinatra/base'

module Sinatra
  module SimpleAssets
    VERSION = '0.0.1'

    module Helpers
      def stylesheet(name)
        settings.assets.paths_for("#{name}.css").map do |file|
          "<link rel=\"stylesheet\" href=\"#{url(file)}\">"
        end.join("\n")
      end

      def javascript(name)
        settings.assets.paths_for("#{name}.js").map do |file|
          "<script src=\"#{url(file)}\"></script>"
        end.join("\n")
      end
    end

    class Bundle
      def initialize(name, type, root, files)
        @name = name
        @type = type
        @root = root
        @files = files
      end

      def name
        "#{@name}.#{@type}"
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

      def create_bundle(name, type, name, files)
        bundle = Bundle.new(name, type, @app.public_folder, files)
        @bundles[bundle.name] = bundle
      end

      def paths_for(bundle)
        []
      end

      def content_for(bundle)
        bundle = @bundles[@hashes[bundle]]
        bundle.content if bundle
      end
    end

    def assets(&block)
      @assets ||= Assets.new(self, &block)
    end

    def self.registered(app)
      app.helpers SimpleAssets::Helpers

      app.get '/stylesheets/:bundle' do
        serve_content(params[:bundle], :css)
      end

      app.get '/javascripts/:bundle' do
        serve_content(params[:bundle], :js)
      end

      def serve_content(bundle, type)
        content = settings.assets.content_for(bundle)
        not_found unless content

        content_type type
        content
      end
    end
  end
end
