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

    class Assets
      def initialize(app, &block)
        @app = app
        instance_eval(&block)
      end

      def css(name, files)
      end

      def js(name, files)
      end

      def paths_for(name)
        []
      end
    end

    def assets(&block)
      @assets ||= Assets.new(self, &block)
    end

    def self.registered(app)
      app.helpers SimpleAssets::Helpers
    end
  end
end
