return unless defined?(ActiveRecord)

require 'singleton'
require_relative 'reloader'

module ConsoleHelpers
  class RecordStore < Hash
    include Singleton
    include ActiveSupport::Configurable
    config_accessor :lookup_logic

    class << self
      delegate :clear, :delete, to: :instance
      delegate :each, to: :subclasses

      def reload!
        instance.values.compact.map(&:reload!)
      end

      def [](scope)
        instance.fetch(scope.to_sql) do |sql|
          instance[sql] = lookup_logic[scope]&.extend(StoredRecord)
        end
      end
    end

    module StoredRecord
      def reload!(*)
        # Have to load a fresh version of the class to reflect any changes
        self.class.name.constantize.find_by(id: id).tap do |reloaded|
          reloaded&.extend(StoredRecord)
          ConsoleHelpers::RecordStore.each do |store_class|
            store_class.instance.transform_values! { |record| record == self ? reloaded : record }.compact!
          end
        end
      end
    end
  end

  class RandomRecordStore < RecordStore
    self.lookup_logic = ->(scope) { scope.offset(rand(scope.count)).first }
  end

  class FirstRecordStore < RecordStore
    self.lookup_logic = ->(scope) { scope.first }
  end

  def clear_record_stores
    ConsoleHelpers::RecordStore.each(&:clear)
  end
  alias clear_stores clear_record_stores

  def reload_record_stores
    ConsoleHelpers::RecordStore.each(&:reload!)
  end

  Reloader.register(prepend: true, &instance_method(:reload_record_stores).bind(self))
end
