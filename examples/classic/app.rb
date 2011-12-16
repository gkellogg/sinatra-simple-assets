require 'bundler'
Bundler.require(:default)

configure do
  set :app_name, 'Sinatra Simple Assets'

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
end

get '/' do
  erb :index
end
