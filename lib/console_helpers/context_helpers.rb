require_relative 'reloader'
require_relative 'pad'

module ConsoleHelpers
  module ContextHelpers
    def dive(obj)
      workspace.main.cb(obj)
      obj.extend(ConsoleHelpers::ContextHelpers)
    end

    def surface
      dive(TOPLEVEL_BINDING.receiver)
    end

    def load_scratch(scratch_name = nil)
      Pad.find(scratch_name || -1)&.submerge
    end
    alias_method :scratch, :load_scratch
    alias_method :scrat, :load_scratch # Easier to type with one hand. Also the "Ice Age" squirrel.

    def root_path
      return Rails.root if defined?(Rails.root)

      Pathname.new('.').expand_path
    end
  end

  include ContextHelpers
end

ConsoleHelpers::Reloader.register do
  workspace.main.submerge if workspace.main.is_a?(Pad)
end
