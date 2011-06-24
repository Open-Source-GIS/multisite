# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "multisite/version"

Gem::Specification.new do |s|
  s.name        = "multisite"
  s.version     = Multisite::VERSION
  s.authors     = ["Josh Adams"]
  s.email       = ["josh@isotope11.com"]
  s.homepage    = ""
  s.summary     = %q{Make a naive rails app multisite easily}

  s.rubyforge_project = "multisite"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activerecord', '~> 3.1.0.rc4'
  s.add_dependency 'activesupport', '~> 3.1.0.rc4'

  s.add_development_dependency "sqlite3", "~> 1.3.3"
  s.add_development_dependency 'rspec', '~> 2.6'
  s.add_development_dependency 'ruby-debug19'
end
