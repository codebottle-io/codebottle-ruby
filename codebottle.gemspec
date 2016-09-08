# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codebottle/version'

Gem::Specification.new do |spec|
  spec.name          = "codebottle"
  spec.version       = Codebottle::VERSION
  spec.licenses      = ["GPL-3.0"]
  spec.authors       = ["Bradley Shaw"]
  spec.email         = ["indigotiger@sigint.pw"]

  spec.summary       = %q{A Ruby library to interact with CodeBottle's API}
  spec.description   = %q{A Ruby library to interact with the https://codebottle.io/ API}
  spec.homepage      = "https://github.com/codebottle-io/codebottle-ruby"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.11"
end
