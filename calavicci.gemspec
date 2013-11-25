# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calavicci/version'

Gem::Specification.new do |spec|
  spec.name          = "calavicci"
  spec.version       = Calavicci::VERSION
  spec.authors       = ["Todd Grooms"]
  spec.email         = ["todd.grooms@gmail.com"]
  spec.description   = "The gist for the drawable_convert.py script can be found here: https://gist.github.com/kmansoft/2771791"
  spec.summary       = "Wrapper to execute a drawable converter to convert high resolution Android resources to lower resolution resources."
  spec.homepage      = "http://github.com/metova/calavicci"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ["calavicci", "convert", "drawable_convert.py"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
