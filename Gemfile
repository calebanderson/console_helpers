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

  # gem 'centrak_helpers', path: '../centrak_helpers'
  # gem 'temperature_helpers', path: '../temperature_helpers'
end

# To use a debugger
# gem 'byebug', group: [:development, :test]
