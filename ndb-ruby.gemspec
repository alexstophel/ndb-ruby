# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ndb/version"

Gem::Specification.new do |spec|
  spec.name = "ndb-ruby"
  spec.version = NDB::VERSION
  spec.authors = ["Alex Stophel"]
  spec.email = ["alexstophel@gmail.com"]

  spec.summary = "Gem to wrap NDB API"
  spec.description = "Gem to wrap NDB API"
  spec.license = "MIT"

  spec.files = `git ls-files`.split("\n")

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
