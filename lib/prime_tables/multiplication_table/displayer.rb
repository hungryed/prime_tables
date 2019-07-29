require_relative "console_printer"

module PrimeTables
  class MultiplicationTable
    class Displayer
      class InvalidDisplayType < Errors::BaseError; end
      attr_reader :table, :output

      def initialize(table:, output:)
        @table = table
        @output = output
      end

      def display!
        output_class.new(table: table).display!
      end

      private

      def output_class
        return ConsolePrinter if output.to_sym == :console
        raise Errors::InvalidDisplayType.new("No output type for: #{output}")
      end
    end
  end
end
