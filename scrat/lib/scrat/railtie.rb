module Scrat
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      Object.extend(Scrat::Context)
      Object.include(Scrat::Context)
      irb_main.extend(Scrat::Context)

      ReloaderHooks.register do
        current_workspace.main.submerge if current_workspace&.main.is_a?(Pad)
      end
    end
  end
end
