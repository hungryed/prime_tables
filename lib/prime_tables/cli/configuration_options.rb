require 'optparse'

module PrimeTables
  class Cli
    class ConfigurationOptions
      attr_reader :args

      def initialize(args)
        @args = args
      end

      def prime_count
        @prime_count ||= args.first
      end

      def parse_args
        option_parser.parse!(args)
      end

      private

      def option_parser
        OptionParser.new do |parser|
          parser.banner = "Usage: ./bin/runner [count]\n\n"
        end
      end
    end
  end
end

