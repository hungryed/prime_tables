require "prime_tables/cli/configuration_options"

RSpec.describe PrimeTables::Cli::ConfigurationOptions do
  let(:args) { [] }
  subject { described_class.new(args) }

  describe "#prime_count" do
    context "without any provided arguments" do
      it "returns nil" do
        expect(subject.prime_count).to be_nil
      end
    end

    context "with provided arguments" do
      let(:args) { ["19"] }

      it "pulls the number from the arguments" do
        expect(subject.prime_count).to eq "19"
      end
    end
  end

  describe "#parse_args" do
    let(:option_parser_dub) { instance_double(OptionParser) }

    before :each do
      allow(subject).to receive(:option_parser).and_return(option_parser_dub)
    end

    it "calls parse with the option parser" do
      expect(option_parser_dub).to receive(:parse!).with(args)
      subject.parse_args
    end
  end
end
