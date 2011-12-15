# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'sinatra/simple_assets'

Gem::Specification.new do |s|
  s.name        = 'sinatra-simple-assets'
  s.version     = Sinatra::SimpleAssets::VERSION
  s.authors     = ["Pete O'Grady"]
  s.email       = ['pete@peteogrady.com']
  s.homepage    = ""
  s.summary     = %q{Asset minification and bundling for Sinatra}
  s.description = %q{Asset minification and bundling for Sinatra}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'cssmin', '1.0.2'
  s.add_dependency 'sinatra', '~> 1.3.0'
  s.add_dependency 'therubyracer-heroku', '0.8.1.pre3'
  s.add_dependency 'uglifier', '1.1.0'
end
