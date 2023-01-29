# $dsl = self
source 'https://rubygems.org'
# git_source(:mine) { |repo| "https://github.com/calebanderson/#{repo}.git" }
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in console_helpers.gemspec.
gemspec

group :development do
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'sqlite3'

  # gem 'reactive_console', git: 'https://github.com/calebanderson/reactive_console'
  gem 'centrak_helpers', path: '../centrak_helpers'
  gem 'method_looker_upper', path: '../method_looker_upper'
  gem 'quick_records', path: '../quick_records'
  gem 'responsive_console', path: '../responsive_console'
  gem 'reloader_hooks', git: 'https://github.com/calebanderson/reloader_hooks'
  gem 'rubymine_version', path: '../rubymine_version'
  gem 'scrat', path: '../scrat'
  gem 'shared_helpers', path: '../shared_helpers'
  gem 'svg_analyzer', path: '../svg_analyzer'
  gem 'temperature_helpers', path: '../temperature_helpers'
end

# To use a debugger
# gem 'byebug', group: [:development, :test]
