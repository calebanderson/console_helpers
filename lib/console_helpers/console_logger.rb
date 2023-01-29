module ConsoleHelpers
  class ConsoleLogger < Logger
    delegate :indent, to: :formatter

    def initialize(**options)
      options[:formatter] = ConsoleFormatter.new
      super($stdout, **options)
    end

    def add(*messages)
      messages.each do |message|
        super(UNKNOWN, message)
      end
      true
    end

    class ConsoleFormatter < Logger::Formatter
      attr_writer :indent_level

      def indent(count = nil)
        self.indent_level = count || indent_level.to_i + 1
      end

      def indent_level
        @indent_level ||= 0
      end

      def indented
        self.indent_level += 1
        yield
      ensure
        self.indent_level -= 1
      end

      def call(_severity, _time, _progname, input)
        format_object(input)
      end

      def format_object(input)
        case input
        when Hash then format_hash(input)
        when Array then format_array(input)
        else "#{'  ' * indent_level}#{input}"
        end
      end

      def format_array(input)
        format_object "[ #{input.join(' | ')} ]"
      end

      def format_hash(input)
        input.flat_map do |key, value|
          format_object "[ #{input.join(' | ')} ]"
        end
      end
    end
  end

  @logger = ConsoleLogger.new
end
