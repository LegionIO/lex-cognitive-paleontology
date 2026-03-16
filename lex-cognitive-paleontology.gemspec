# frozen_string_literal: true

require_relative 'lib/legion/extensions/cognitive_paleontology/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-cognitive-paleontology'
  spec.version       = Legion::Extensions::CognitivePaleontology::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = 'Cognitive paleontology LEX — study extinct thought ' \
                       'patterns and fossil records of abandoned ideas'
  spec.description   = 'Models the fossil record of the mind: extinct thought ' \
                       'patterns, abandoned strategies, evolutionary dead-ends, ' \
                       'and the geological layers of cognitive history.'
  spec.homepage      = 'https://github.com/LegionIO/lex-cognitive-paleontology'

  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']        = spec.homepage
  spec.metadata['source_code_uri']     = spec.homepage
  spec.metadata['documentation_uri']   = "#{spec.homepage}#readme"
  spec.metadata['changelog_uri']       = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['bug_tracker_uri']     = "#{spec.homepage}/issues"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.start_with?('spec/', '.', 'Gemfile')
    end
  end
  spec.require_paths = ['lib']
  spec.add_development_dependency 'legion-gaia'
end
