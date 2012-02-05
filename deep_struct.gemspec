# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'deep_struct/version'

Gem::Specification.new do |s|
  s.name         = "deep_struct"
  s.version      = DeepStruct::VERSION
  s.authors      = ["Tammer Saleh"]
  s.email        = "tsaleh@gmail.com"
  s.homepage     = "https://github.com/tsaleh/deep_struct"
  s.summary      = "[TODO: summary]"
  s.description  = "[TODO: description]"

  s.files        = `git ls-files app lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
end
