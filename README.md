# Sinatra Simple Assets

* Concatinates and minifies JavaScript and CSS
* Provides view helpers

[See examples folder for sample apps](https://github.com/peteog/sinatra-simple-assets/tree/master/examples)

## View helper output

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

### CSS

    <%= stylesheet :application %>

development:

    <link rel="stylesheet" href="http://localhost:9292/stylesheets/bootstrap.css">
    <link rel="stylesheet" href="http://localhost:9292/stylesheets/application.css">

production:

    <link rel="stylesheet" href="http://localhost:9292/stylesheets/application-1d512aa30517f9c05c6fc81258c586caeafc1136.css">

### JavaScript

    <%= javascript :application %>

development:

    <script src="http://localhost:9292/javascripts/bootstrap-modal.js"></script>
    <script src="http://localhost:9292/javascripts/bootstrap-dropdown.js"></script>
    <script src="http://localhost:9292/javascripts/bootstrap-scrollspy.js"></script>
    <script src="http://localhost:9292/javascripts/bootstrap-buttons.js"></script>
    <script src="http://localhost:9292/javascripts/bootstrap-tabs.js"></script>
    <script src="http://localhost:9292/javascripts/bootstrap-twipsy.js"></script>
    <script src="http://localhost:9292/javascripts/bootstrap-popover.js"></script>
    <script src="http://localhost:9292/javascripts/bootstrap-alerts.js"></script>
    <script src="http://localhost:9292/javascripts/application.js"></script>

production:

    <script src="http://localhost:9292/javascripts/application-2e4cd283a08121a850c0117a1ca64648e34cce98.js"></script>
