module ConsoleHelpers
  module GlobalHelpers
    # Unused, although should probably be implemented in a couple places.
    # Keeping for now.
    def safe_singleton_class(writing = true)
      singleton_class
    rescue TypeError
      self.class unless writing
    end
  end
end
