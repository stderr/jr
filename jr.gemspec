# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "jr"
  spec.version       = "0.0.1"
  spec.authors       = ["Josh Simpson"]
  spec.email         = ["jsimpson@instructure.com"]
  spec.summary       = %q{jr}
  spec.description   = "JIRA reporting for Instructure."
  spec.homepage      = "http://www.instructure.com/"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib,spec}/**/*")
  spec.executables   = Dir.glob("bin/**/*").map { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize", "~> 0.7"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "activesupport", "~> 4.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 3.4"
end
