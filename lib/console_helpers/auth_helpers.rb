return unless defined?(ActiveScaffold)

require_relative 'reloader'

module ConsoleHelpers
  module AuthHelpers
    # class << self
    #   def sign_in(user)
    #     @current_user_id = user.id # only carrying over id so the User model is updated on reload
    #     _setup_current_user
    #     @current_user = user
    #
    #     true
    #   end
    #
    #   def current_user
    #     defined?(@current_user) ? @current_user : (@current_user = registry.current_user_proc.try(:call))
    #   end
    #
    #   def _setup_current_user
    #     registry.current_user_proc ||= proc do
    #       User.find_by(id: @current_user_id) if @current_user_id
    #     end
    #
    #     remove_instance_variable(:@current_user) if defined?(@current_user) # clear cached value causing reload
    #   end
    # end

    # delegate :sign_in, :current_user, to: '::ConsoleHelpers::AuthHelpers'

    if defined?(Temperature::Application)
      # extend PolicyHelper
      # singleton_class.alias_method :policy_user, :current_user
      # delegate :policy_user, to: '::ConsoleHelpers::AuthHelpers'
      #
      # def activate_authlogic
      #   UserSessionsController.new.send(:activate_authlogic)
      # end
      #
      # def as_full_admin
      #   sign_in User.full_admin.first!
      # end
      #
      # def as_dept_admin
      #   sign_in User.department_admin.first!
      # end
      #
      # def self.registry
      #   ActiveScaffold::Registry
      # end
    elsif defined?(Activate::Application)
      # def self.registry
      #   ActiveRecord::Base
      # end
    end
  end

  include AuthHelpers
  ReloaderHooks.register(&AuthHelpers.method(:_setup_current_user))
end
