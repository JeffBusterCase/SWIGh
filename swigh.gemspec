# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swigh/version'

Gem::Specification.new do |spec|
  spec.name          = "swigh"
  spec.version       = SWIGh::VERSION
  spec.authors       = ["Jefferson David Silva Bomfim"]
  spec.email         = ["jefferson_bomfim@outlook.com"]

  spec.summary       = %q{SWIG-Ruby help}
  spec.description   = %q{SWIGh help write C and C++ extensions using SWIG-Ruby.}
  spec.homepage      = "https://github.com/JeffBusterCase/SWIGh.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
=begin
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end
=end
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["swigh"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
