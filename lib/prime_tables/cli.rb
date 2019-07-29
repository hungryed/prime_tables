require_relative "./cli/configuration_options"

module PrimeTables
  class Cli
    attr_reader :args

    class << self
      def run(args)
        new(*args).run!
      end
    end

    def initialize(*args)
      @args = args
    end

    def run!
      arg_parser.parse_args
      PrimeTables.display_table_for(
        count: arg_parser.prime_count || 10,
        output: output_type
      )
    end

    private

    def arg_parser
      @arg_parser ||= ConfigurationOptions.new(args)
    end

    def output_type
      :console
    end
  end
end
