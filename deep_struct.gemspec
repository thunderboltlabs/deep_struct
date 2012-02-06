# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'deep_struct/version'

Gem::Specification.new do |s|
  s.name         = "deep_struct"
  s.version      = DeepStruct::VERSION
  s.authors      = ["Thunderbolt Labs"]
  s.email        = "us@thunderboltlabs.com"
  s.homepage     = "https://github.com/thunderboltlabs/deep_struct"
  s.summary      = "Converts ruby hashes and arrays into objects."
  s.description  = "That's about it, really."

  s.files        = `git ls-files app lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-bundler"
  s.add_development_dependency 'ruby_gntp'
  s.add_development_dependency "rspec"
end
