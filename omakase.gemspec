# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omakase/version'

Gem::Specification.new do |spec|
  spec.name          = "omakase"
  spec.version       = Omakase::VERSION
  spec.authors       = ["Adrian Kuhn"]
  spec.email         = ["akuhn@gmx.ch"]

  spec.summary       = 'My personal extensions.'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
