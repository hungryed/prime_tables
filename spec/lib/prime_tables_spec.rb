require "prime_tables"

RSpec.describe PrimeTables do
  describe ".first" do
    it "delegates to sieve" do
      expect(described_class::EratosthenesSieve).to receive(:first).with(5)
      described_class.first(5)
    end
  end

  describe ".display_table_for" do
    let(:dub) { instance_double(described_class::MultiplicationTable) }

    it "delegates to table" do
      expect(described_class::EratosthenesSieve).to receive(:first).with(5).and_return("a list of primes")
      expect(described_class::MultiplicationTable).to receive(:new).with(values: "a list of primes").and_return(dub)
      expect(dub).to receive(:display).with(output: :test).and_return("a table")
      expect(described_class.display_table_for(count: 5, output: :test)).to eq "a table"
    end

    it "returns the correct string" do
      expect(described_class.display_table_for(count: 10, output: :console)).to eq(
        <<-STR.chomp
    |  2  |  3  |  5  |  7  | 11  | 13  | 17  | 19  | 23  | 29
---------------------------------------------------------------
 2  |  4  |  6  | 10  | 14  | 22  | 26  | 34  | 38  | 46  | 58
---------------------------------------------------------------
 3  |  6  |  9  | 15  | 21  | 33  | 39  | 51  | 57  | 69  | 87
---------------------------------------------------------------
 5  | 10  | 15  | 25  | 35  | 55  | 65  | 85  | 95  | 115 | 145
---------------------------------------------------------------
 7  | 14  | 21  | 35  | 49  | 77  | 91  | 119 | 133 | 161 | 203
---------------------------------------------------------------
11  | 22  | 33  | 55  | 77  | 121 | 143 | 187 | 209 | 253 | 319
---------------------------------------------------------------
13  | 26  | 39  | 65  | 91  | 143 | 169 | 221 | 247 | 299 | 377
---------------------------------------------------------------
17  | 34  | 51  | 85  | 119 | 187 | 221 | 289 | 323 | 391 | 493
---------------------------------------------------------------
19  | 38  | 57  | 95  | 133 | 209 | 247 | 323 | 361 | 437 | 551
---------------------------------------------------------------
23  | 46  | 69  | 115 | 161 | 253 | 299 | 391 | 437 | 529 | 667
---------------------------------------------------------------
29  | 58  | 87  | 145 | 203 | 319 | 377 | 493 | 551 | 667 | 841
STR
      )
    end
  end
end
