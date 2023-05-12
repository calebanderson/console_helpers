require_relative 'lib/rubymine_version/version'

Gem::Specification.new do |spec|
  spec.name        = 'rubymine_version'
  spec.version     = RubymineVersion::VERSION
  spec.authors     = ['calebanderson']
  spec.email       = ['caleb.r.anderson.1@gmail.com']
  spec.homepage    = 'https://github.com/calebanderson/rubymine_version'
  spec.summary     = 'Detects the current Rubymine version and path'
  spec.description = 'Detects the current Rubymine version and path'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'TODO: Set to http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/calebanderson/rubymine_version'
  spec.metadata['changelog_uri'] = 'https://github.com/calebanderson/rubymine_version/blob/master/CHANGELOG.md'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 4.2'
end
