require "prime_tables/multiplication_table/displayer"

RSpec.describe PrimeTables::MultiplicationTable::Displayer do
  let(:table) {
    [
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
    ]
  }
  let(:output) { :console }
  let(:test_display) { instance_double(PrimeTables::MultiplicationTable::ConsolePrinter) }
  subject { described_class.new(table: table, output: output) }

  describe "#display!" do
    context "console" do
      before :each do
        expect(PrimeTables::MultiplicationTable::ConsolePrinter).to receive(:new).with(table: table).and_return(test_display)
      end

      it "delegates to the displayer" do
        expect(test_display).to receive(:display!)
        subject.display!
      end
    end

    context "invalid" do
      let(:output) { :no_match }

      it "raises an error" do
        expect { subject.display! }.to raise_error(PrimeTables::Errors::InvalidDisplayType, "No output type for: no_match")
      end
    end
  end
end
