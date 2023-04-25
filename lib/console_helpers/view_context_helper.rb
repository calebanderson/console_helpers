module ConsoleHelpers
  module ViewContextHelper
    attr_writer :view_context_controller

    def view_context_controller
      @view_context_controller ||= ApplicationController
    end

    def view_context(controller_class = view_context_controller)
      controller = controller_class.new.tap { |c| c.request = fake_request }
      controller.view_context.tap do |context|
        context.define_singleton_method(:_generate_paths_by_default) { false }
        context.extend(MethodPublication)
      end
    end

    # Rails 4.2.10 uses new, but the functionality was moved to #create in later versions
    def fake_request
      opts = { 'HTTP_HOST' => 'localhost:3000' }
      ActionDispatch::TestRequest.try(:create, opts) || ActionDispatch::TestRequest.new(opts)
    end
  end
end
