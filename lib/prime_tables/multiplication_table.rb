require_relative "./multiplication_table/displayer"

module PrimeTables
  class MultiplicationTable
    attr_reader :values

    def initialize(values:)
      @values = values
    end

    def display(output:)
      Displayer.new(
        table: table,
        output: output
      ).display!
    end

    def table
      @table ||= [headers, *multiplication_table_rows]
    end

    private

    def headers
      [
        nil,
        *values
      ]
    end

    def multiplication_table_rows
      values.map.with_index do |num, i|
        products = values.map do |inner_num|
          num * inner_num
        end
        [
          values[i],
          *products
        ]
      end
    end
  end
end
