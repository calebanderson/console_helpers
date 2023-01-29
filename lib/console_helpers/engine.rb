module ConsoleHelpers
  class Engine < ::Rails::Engine
    isolate_namespace ConsoleHelpers

    config.after_initialize do
      ConsoleHelpers.mount(Object)
      ConsoleHelpers.mount(TOPLEVEL_BINDING.receiver)

      # ReloaderHooks.register(prepend: true) do
      #   ConsoleHelpers.reload
      # end
    end
  end
end
