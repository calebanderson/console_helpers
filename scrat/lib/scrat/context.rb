module Scrat
  module Context
    def current_workspace
      IRB.conf[:MAIN_CONTEXT].workspace
    rescue NoMethodError # IRB.conf may not exist
      nil
    end

    def irb_main
      TOPLEVEL_BINDING.receiver
    end

    def dive(obj)
      current_workspace.main.cb(obj)
      obj.extend(Scrat::Context)
    end

    def surface
      dive(irb_main)
    end

    def load_scratch(scratch_name = nil)
      Pad.find(scratch_name || -1)&.submerge
    end
    alias_method :scratch, :load_scratch
    alias_method :scrat, :load_scratch # Easier to type with one hand. Also the "Ice Age" squirrel.
  end
end
