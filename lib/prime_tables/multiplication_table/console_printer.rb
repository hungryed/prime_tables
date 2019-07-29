module PrimeTables
  class MultiplicationTable
    class ConsolePrinter
      attr_reader :table

      def initialize(table:)
        @table = table
      end

      def display!
        output(table_string)
        table_string
      end

      def table_string
        @table_string ||= table.each_with_index.with_object([]) do |(row, i), memo|
          raw_row = format_row(row)
          memo << raw_row.rstrip
          memo << "-" * raw_row.length unless (i + 1) == table.length
        end.join("\n")
      end

      private

      def format_row(row)
        row.map { |node| format_node(node) }.join(" | ")
      end

      def format_node(node)
        node.to_s.center(cell_width)
      end

      def cell_width
        @cell_width ||= largest_number.to_s.length
      end

      def largest_number
        table.last.last
      end

      def output(string)
        puts string
      end
    end
  end
end
