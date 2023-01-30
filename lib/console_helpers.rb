require 'console_helpers/version'
require 'shared_helpers'
require 'rubymine_version'
require 'reloader_hooks'
require 'responsive_console'
require 'scrat'
require 'quick_records'
require 'method_explorer'
require 'console_helpers/engine'

module ConsoleHelpers
  class << self
    attr_reader :logger

    def mount(object)
      init
      object.singleton_class.include(ConsoleHelpers)
    end

    def init
      files.each(&method(:require))
      extend(self)
    end

    def reload
      ReloaderHooks.initialized!
      silence_warnings { files.each(&method(:load)) }
      extend self
    end

    # All the .rb files that start with a letter (files beginning with an underscore are not included)
    def files
      Dir.glob(File.expand_path('./console_helpers/**/[a-z]*.rb', __dir__))
    end

    def log(msg)
      @logger.add(msg)
    end
  end
end
