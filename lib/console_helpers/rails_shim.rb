require 'forwardable'

module ConsoleHelpers
  module RailsShim
    module NoRails
      module ObjectExt
        def present?
          self && !try(:empty?) && true
        end

        def presence
          self if present?
        end

        def blank?
          !present?
        end

        def try(meth, *args, &blk)
          public_send(meth, *args, &blk) if respond_to?(meth)
        end

        def delegate(*meths, to:)
          extend Forwardable
          def_instance_delegators(to, *meths)
        end

        def silence_warnings
          orig = $VERBOSE
          $VERBOSE = nil
          yield
        ensure
          $VERBOSE = orig
        end
      end

      module StringExt
        # Nearly general replacement
        def constantize
          Object.const_get(self)
        end

        # Nearly general replacement
        def safe_constantize
          constantize if Object.const_defined?(self)
        end

        # General replacement of String#underscore in rails
        def underscore
          gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2') # Runs of capitals (insert before the last one)
            .gsub(/([a-z\d])([A-Z])/, '\1_\2') # Runs of lowercase, then a capital
            .tr('-', '_')
            .downcase
        end

        def squish
          dup.squish!
        end

        def squish!
          gsub!(/\s+/, ' ').strip!
        end

        def demodulize
          split('::', -1).last
        end

        def remove(*args)
          dup.remove!(*args)
        end

        def remove!(*patterns)
          patterns.each { |p| gsub!(p, '') }
          self
        end
      end
    end

    module Version4
      module StringExt
        # Rails 5 includes a rescue for incorrect constant names (usually due to acronym capitalization)
        def safe_constantize
          super
        rescue LoadError
          warn "#safe_constantize would raise without console helpers: #{dump}"
          nil
        end
      end
    end
  end
end

if defined?(Rails)
  String.prepend(ConsoleHelpers::RailsShim::Version4::StringExt) if Rails.version.to_i <= 4
else
  Object.include ConsoleHelpers::RailsShim::NoRails::ObjectExt
  String.include(ConsoleHelpers::RailsShim::NoRails::StringExt)
end
