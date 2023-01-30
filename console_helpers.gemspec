# frozen_string_literal: true
require_relative 'lib/console_helpers/version'

Gem::Specification.new do |spec|
  spec.name        = 'console_helpers'
  spec.version     = ConsoleHelpers::VERSION
  spec.authors     = ['calebanderson']
  spec.email       = ['caleb.r.anderson.1@gmail.com']
  spec.homepage    = 'https://github.com/calebanderson/console_helpers'
  spec.summary     = 'Custom helpers for debugging'
  spec.description = 'Custom helpers for debugging'
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 2.2'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'TODO: Set to http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/calebanderson/console_helpers'
  spec.metadata["changelog_uri"] = 'https://github.com/calebanderson/console_helpers/blob/master/CHANGELOG.md'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 4.2'

  spec.add_dependency 'method_explorer'
  spec.add_dependency 'quick_records'
  spec.add_dependency 'reloader_hooks'
  spec.add_dependency 'responsive_console'
  spec.add_dependency 'rubymine_version'
  spec.add_dependency 'scrat'
  spec.add_dependency 'shared_helpers'
  spec.add_dependency 'svg_analyzer'
end
