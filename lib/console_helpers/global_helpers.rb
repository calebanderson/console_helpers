module ConsoleHelpers
  module GlobalHelpers
    # def workspace
    #   IRB.conf[:MAIN_CONTEXT].workspace
    # rescue NoMethodError # IRB.conf may not exist
    #   nil
    # end

    # def safe_singleton_class(writing = true)
    #   singleton_class
    # rescue TypeError
    #   self.class unless writing
    # end
  end
end

Object.include(ConsoleHelpers::GlobalHelpers)
