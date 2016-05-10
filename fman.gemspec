# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fman/version"

Gem::Specification.new do |spec|
  spec.name          = "fman"
  spec.version       = Fman::VERSION
  spec.authors       = ["Boleslaw Kurowski"]
  spec.email         = ["boleslaw.kurowski@gmail.com"]

  spec.summary       = %q(Your personal file delivery officer.)
  spec.description   = %q(Sends and tracks sent files to external parties.)
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
