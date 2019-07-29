require_relative "./prime_tables/errors"
require_relative "./prime_tables/cli"
require_relative "./prime_tables/eratosthenes_sieve"
require_relative "./prime_tables/multiplication_table"

module PrimeTables
  class << self
    def first(n)
      PrimeTables::EratosthenesSieve.first(n)
    end

    def display_table_for(count:, output:)
      PrimeTables::MultiplicationTable.new(
        values: first(count),
      ).display(output: output)
    end
  end
end
