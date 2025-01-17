# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'widgeo/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.7.0'
  spec.name = 'widgeo'
  spec.version = Widgeo::VERSION
  spec.authors = ['Chris Garrett']
  spec.email = ['chris@hyperlaunch.com']
  spec.summary = 'Provides easy access to the worlds territories and their continents.'
  spec.description = 'Listing and filtering of continents and territories. ' \
                     'Includes short names, long names and alpha codes, ' \
                     'following the ISO 3166 standard.'

  spec.homepage = 'https://github.com/hyperlaunch/widgeo'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rubocop', '~> 1.67'
  spec.add_development_dependency 'ruby-lsp', '~> 0.20.1'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
