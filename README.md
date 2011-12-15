# Sinatra Simple Assets

    # Gemfile
    gem 'sinatra-simple-assets', :require => 'sinatra/simple_assets'

    # Sinatra app
    register Sinatra::SimpleAssets

    assets do
      css :application, [
        '/stylesheets/bootstrap.css',
        '/stylesheets/application.css'
      ]
      js :application, [
        '/javascripts/bootstrap-modal.js',
        '/javascripts/bootstrap-dropdown.js',
        '/javascripts/bootstrap-scrollspy.js',
        '/javascripts/bootstrap-buttons.js',
        '/javascripts/bootstrap-tabs.js',
        '/javascripts/bootstrap-twipsy.js',
        '/javascripts/bootstrap-popover.js',
        '/javascripts/bootstrap-alerts.js',
        '/javascripts/application.js'
      ]
    end

    # Views
    <%= javascript :application %>
    <%= stylesheet :application %>

    # Rakefile
    namespace :assets do
      desc 'Precompile assets'
      task :precompile do
        App.assets.precompile
      end
    end
