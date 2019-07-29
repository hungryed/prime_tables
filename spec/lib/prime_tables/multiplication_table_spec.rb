require "prime_tables/multiplication_table"

RSpec.describe PrimeTables::MultiplicationTable do
  let(:values) {
    [2,3,5,7,11,13,17,19,23,29]
  }
  subject { described_class.new(values: values) }

  describe "#table" do
    it "returns a multiplication table with the values as the first row" do
      expect(subject.table).to eq([
        [nil, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29],
        [2, 4, 6, 10, 14, 22, 26, 34, 38, 46, 58],
        [3, 6, 9, 15, 21, 33, 39, 51, 57, 69, 87],
        [5, 10, 15, 25, 35, 55, 65, 85, 95, 115, 145],
        [7, 14, 21, 35, 49, 77, 91, 119, 133, 161, 203],
        [11, 22, 33, 55, 77, 121, 143, 187, 209, 253, 319],
        [13, 26, 39, 65, 91, 143, 169, 221, 247, 299, 377],
        [17, 34, 51, 85, 119, 187, 221, 289, 323, 391, 493],
        [19, 38, 57, 95, 133, 209, 247, 323, 361, 437, 551],
        [23, 46, 69, 115, 161, 253, 299, 391, 437, 529, 667],
        [29, 58, 87, 145, 203, 319, 377, 493, 551, 667, 841]
      ])
    end
  end

  describe "#display" do
    let(:table) { [[1], [1]] }
    let(:display_dub) { instance_double(described_class::Displayer) }

    before :each do
      allow(subject).to receive(:table).and_return(table)
    end

    it "delegates to the displayer" do
      expect(described_class::Displayer).to receive(:new).
        with(table: table, output: :test).
        and_return(display_dub)
      expect(display_dub).to receive(:display!)

      subject.display(output: :test)
    end
  end
end
