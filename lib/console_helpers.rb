require "console_helpers/version"
require "console_helpers/engine"

module ConsoleHelpers
  class << self
    CONSOLE_WIDTH_RANGE = (100..500).freeze
    DEFAULT_CONSOLE_WIDTH = 250

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
      Reloader.initialized!
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

    def width
      @width ||= DEFAULT_CONSOLE_WIDTH
    end

    def config_width(given_width = nil)
      input_width = given_width || _get_input_width
      return true if input_width.zero?

      if CONSOLE_WIDTH_RANGE.cover?(input_width)
        @width = input_width
        print('New ') & display_width if given_width.nil?
        true
      else
        puts "Width #{input_width} not within accepted range (#{CONSOLE_WIDTH_RANGE})"
      end
    end

    def _get_input_width
      display_width
      puts 'Press enter/return to accept. Enter a width or characters up to the desired limit, then press enter to set.'
      input = gets.chomp
      input.size < CONSOLE_WIDTH_RANGE.min && input[/^\d+$/] ? input.to_i : input.size
    end

    def display_width
      puts "Console Width: #{width}"
      puts '-' * width.to_i
    end
  end
end
