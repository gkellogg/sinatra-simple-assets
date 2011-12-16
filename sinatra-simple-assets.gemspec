# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = 'sinatra-simple-assets'
  s.version     = '0.0.4'
  s.authors     = ["Pete O'Grady"]
  s.email       = ['pete@peteogrady.com']
  s.homepage    = 'https://github.com/peteog/sinatra-simple-assets'
  s.summary     = %q{Asset minification and bundling for Sinatra}
  s.description = %q{Asset minification and bundling for Sinatra}

  s.files = [
    ".gitignore",
    "Gemfile",
    "README.md",
    "Rakefile",
    "lib/sinatra/simple_assets.rb",
    "sinatra-simple-assets.gemspec"
  ]
  s.require_paths = ['lib']

  s.add_dependency 'cssmin', '~> 1.0.2'
  s.add_dependency 'sinatra', '~> 1.3.0'
  s.add_dependency 'uglifier', '~> 1.2.0'
end
