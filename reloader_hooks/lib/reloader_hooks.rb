require "reloader_hooks/version"
require "reloader_hooks/railtie"

module ReloaderHooks
  class << self
    def register(prepend: false, &block)
      return false if initialized?

      # Not willing to just assume it's poor coding, but for some reason the order of these callbacks
      # are run in an order the reverse of what the +prepend+ argument would have you think...
      prepend = !prepend
      if defined?(ActiveSupport::Reloader) # Rails 5.2.4
        Rails.application.reloader.to_complete(:after, prepend: prepend, &block.method(:call))
      elsif defined?(ActionDispatch::Reloader) # Rails 4.2.10
        ActionDispatch::Reloader.to_prepare(:after, prepend: prepend, &block.method(:call))
      else
        false
      end
    end

    def initialized!
      @initialized = true
    end

    def initialized?
      @initialized.present?
    end
  end
end
