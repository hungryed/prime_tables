require "prime_tables/eratosthenes_sieve"

RSpec.describe PrimeTables::EratosthenesSieve do
  let(:count) { 10 }
  subject { described_class.new(count) }

  describe ".first" do
    let(:dub) { instance_double(described_class) }

    it "delegates to an instance" do
      expect(described_class).to receive(:new).with(10).and_return(dub)
      expect(dub).to receive(:compute_primes)
      described_class.first(count)
    end
  end

  describe "#compute_primes" do
    it "returns the list of 10 primes" do
      expect(subject.compute_primes.count).to eq count
    end

    it "returns a list of prime numbers" do
      expect(subject.compute_primes).to eq([
        2,3,5,7,11,13,17,19,23,29
      ])
    end

    context "invalid" do
      let(:count) { "invalid" }

      it "raises an error telling the user the count is invalid" do
        expect { subject.compute_primes }.to raise_error(
          PrimeTables::Errors::InvalidNumber, "Argument must be a number greater than 0. You provided: 'invalid'"
        )
      end
    end
  end
end
