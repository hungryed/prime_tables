require "prime_tables"

RSpec.describe PrimeTables::Cli do
  let(:args) { [] }
  subject { described_class.new(*args) }

  describe ".run" do
    let(:dub) { instance_double(described_class, run!: "running") }

    it "delegates to instance" do
      expect(described_class).to receive(:new).with("some args").and_return(dub)
      described_class.run("some args")
    end
  end

  describe "#run!" do
    context "with defaults" do
      it "displays a table with 10 primes" do
        expect(PrimeTables).to receive(:display_table_for).with(count: 10, output: :console)
        subject.run!
      end
    end

    context "with provided args" do
      let(:args) { [15] }

      it "displays a table with the provided number of primes" do
        expect(PrimeTables).to receive(:display_table_for).with(count: 15, output: :console)
        subject.run!
      end
    end
  end
end
