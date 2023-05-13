require 'pathname'
require 'json'
require "rubymine_version/version"
require "rubymine_version/railtie"

module RubymineVersion
  APP_INFO_SUBPATH = -'Contents/Resources/product-info.json'
  APP_PARENT_DIR = ::Pathname.new(File.expand_path('~/Library/Application Support/JetBrains')).freeze

  class << self
    def current
      running || latest
    end

    def current_root
      current_version = current
      APP_PARENT_DIR / current_version if current_version.present?
    end

    def latest
      APP_PARENT_DIR.children(false).map(&:to_s).grep(/^RubyMine[\d.]+$/).sort.last
    end

    def running
      # IRB#setup is overwritten by RubyMine in an internal config file, so we can get its location
      irb_config = IRB.method(:setup).source_location&.first || return
      app_location = irb_config[/^.*\bRubyMine.app\b/] || return
      info_file = Pathname.new(app_location) + APP_INFO_SUBPATH
      return unless info_file.exist?

      JSON.parse(info_file.read)['dataDirectoryName']
    rescue NameError, JSON::JSONError
      nil
    end
  end
end
