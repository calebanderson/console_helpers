require 'pathname'
require 'benchmark'

module ConsoleHelpers
  module GenericHelpers
    # Modified the message to look like to pry's version of #wtf. Not sure if I like it.


    # def with_log_level(level)
    #   orig = Rails.logger.level
    #   Rails.logger.level = level
    #   yield
    # ensure
    #   Rails.logger.level = orig
    # end
    #
    # # TODO: move logger stuff? Also make a hash of levels and return that
    # def self.toggle_logging(level = :info)
    #   @original_log_level ||= Rails.logger.level
    #   Rails.logger.level = Rails.logger.level == @original_log_level ? level : @original_log_level
    #   true
    # end
    #
    # delegate :toggle_logging, to: :'ConsoleHelpers::GenericHelpers'
  end

  include GenericHelpers
end
