# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swigh/version'

Gem::Specification.new do |spec|
  spec.name          = "swigh"
  spec.version       = Swigh::VERSION
  spec.authors       = ["Jefferson David Silva Bomfim"]
  spec.email         = ["jefferson_bomfim@outlook.com"]

  spec.summary       = %q{SWIG-Ruby help}
  spec.description   = %q{SWIGh help write C and C++ extensions using SWIG-Ruby.}
  spec.homepage      = "https://github.com/JeffBusterCase/SWIGh"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["swigh", "setup", "console"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
