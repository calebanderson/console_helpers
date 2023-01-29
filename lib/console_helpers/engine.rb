module ConsoleHelpers
  class Engine < ::Rails::Engine
    isolate_namespace ConsoleHelpers

    config.after_initialize do
      ConsoleHelpers.mount(Object)
      ConsoleHelpers.mount(irb_main) if console?

      # ReloaderHooks.register(prepend: true) do
      #   ConsoleHelpers.reload
      # end
    end
  end
end
