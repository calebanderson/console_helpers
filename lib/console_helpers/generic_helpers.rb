require 'pathname'
require 'benchmark'

module ConsoleHelpers
  module GenericHelpers
    # Modified the message to look like to pry's version of #wtf. Not sure if I like it.
    def wtf
      @exception = $!.dup || @exception
      return if @exception.nil?

      message = @exception.full_message(highlight: true)
      cause_message = @exception.cause&.full_message(highlight: true)
      message.gsub!(cause_message.to_s, '') # String#remove is not in bare Ruby
      print "Exception: #{@exception.class}:\n"
      puts message.lines[1..-1].join

      nil
    end

    def with_log_level(level)
      orig = Rails.logger.level
      Rails.logger.level = level
      yield
    ensure
      Rails.logger.level = orig
    end

    # TODO: move logger stuff? Also make a hash of levels and return that
    def self.toggle_logging(level = :info)
      @original_log_level ||= Rails.logger.level
      Rails.logger.level = Rails.logger.level == @original_log_level ? level : @original_log_level
      true
    end

    delegate :toggle_logging, to: :'ConsoleHelpers::GenericHelpers'

    # Found out #require_or_load is able to take relative paths... this might be moot
    # Likely not moot. #require_or_load can't re-load files.
    def load_relative(relative_path, extension: '.rb')
      relative_path += extension if File.extname(relative_path) != extension

      caller_file = File.dirname(caller.first)
      caller_file = root_path.to_s unless caller_file[root_path.to_s] # Set it to root if it's outside the repo
      fullpath = File.expand_path(relative_path, caller_file)

      require(fullpath) || silence_warnings { load(fullpath) }
    end
  end

  include GenericHelpers
end
