module ConsoleHelpers
  # Treats all methods as public on an object
  module MethodPublication
    def method_missing(method, *args, &block)
      respond_to?(method, true) ? __send__(method, *args, &block) : super
    end

    def respond_to_missing?(method, *)
      private_methods.include?(method) || protected_methods.include?(method) || super
    end
  end
end
