# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'sinatra/simple_assets'

Gem::Specification.new do |s|
  s.name        = 'sinatra-simple-assets'
  s.version     = Sinatra::SimpleAssets::VERSION
  s.authors     = ["Pete O'Grady"]
  s.email       = ['pete@peteogrady.com']
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'sinatra', '~> 1.3.0'
end
