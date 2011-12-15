require 'sinatra/base'

module Sinatra
  module SimpleAssets
    VERSION = '0.0.1'

    class Assets
      def initialize(app, &block)
        @app = app
        instance_eval(&block)
      end

      def css(name, files)
      end

      def js(name, files)
      end
    end

    def assets(&block)
      @assets ||= Assets.new(self, &block)
    end
  end
end
