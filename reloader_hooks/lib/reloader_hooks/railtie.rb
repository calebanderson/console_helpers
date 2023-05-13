module ReloaderHooks
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      ReloaderHooks.register(&ReloaderHooks.method(:initialized!))
    end
  end
end
