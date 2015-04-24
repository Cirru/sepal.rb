# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cirru/sepal/version'

Gem::Specification.new do |spec|
  spec.name          = "cirru-sepal"
  spec.version       = Cirru::Sepal::VERSION
  spec.authors       = ["jiyinyiyong"]
  spec.email         = ["jiyinyiyong@gmail.com"]
  spec.summary       = %q{Cirru Sepal: play with Cirru AST}
  spec.description   = %q{Generate Ruby AST in Cirru grammar}
  spec.homepage      = "https://github.com/Cirru/sepal.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'cirru-parser', '~> 0.0.2'
  spec.add_runtime_dependency 'ruby2ruby', '~> 2.1.4'
end
