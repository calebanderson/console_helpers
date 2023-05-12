module Scrat
  class Pad
    SIMULATED_FILE_NAME = -'scratchpad.rb'

    attr_reader :file

    def initialize(file)
      raise(Errno::ENOENT, file.to_s) unless File.exist?(file)

      @file = Pathname(SharedHelpers.sanitize_for_link(file).first)
    end

    def inspect
      "Pad[#{file.basename}]"
    end

    def print_link(line = nil)
      SharedHelpers.print_file_link(file, *line)
      self
    end

    def submerge
      surface
      dive(binding)
      print_link
      eval(file.read, current_workspace.binding, file.to_s, 1) # rubocop:disable Security/Eval
      nil # Use #return in the scratch file to return a different value
    end

    # Makes #require_relative traverse from the project root, rather than /scratches
    def require_relative(path)
      require(root_path / path)
    end

    class << self
      def find(arg)
        filename = find_filename(arg)
        return if filename.nil?

        fullpath = directory / filename
        new(fullpath)
      end

      def last
        find(-1)
      end

      def create
        next_pad = _next_pad_path
        File.open(next_pad, File::CREAT | File::RDWR) { |f| f.write("# #{next_pad.basename}\n") }
        new(next_pad).print_link
      end

      def find_filename(arg)
        case arg
        when Integer then find_by_integer(arg)
        when String, Symbol then find_by_string(arg.to_s)
        end
      end

      def find_by_integer(num)
        if num.zero?
          'scratch.rb'
        elsif num.negative?
          all[num]&.basename
        else
          "scratch_#{num}.rb"
        end
      end

      def find_by_string(str)
        File.extname(str).present? ? str : "#{str}.rb"
      end

      def all
        # Pathname#glob was added in Ruby 2.5.5
        # directory.glob('*.rb').sort_by(&:mtime)
        Dir[directory / '*.rb'].map(&method(:Pathname)).sort_by(&:mtime)
      end

      def directory
        RubymineVersion.current_root / 'scratches'
      end

      def _next_pad_path(extension = '.rb')
        pad_numbers = directory.children.map do |path|
          path.basename('.*').to_s[/(?<=^scratch_)\d+$/]&.to_i
        end.compact

        directory / "scratch_#{pad_numbers.max.to_i.next}#{extension}"
      end
    end
  end
end
