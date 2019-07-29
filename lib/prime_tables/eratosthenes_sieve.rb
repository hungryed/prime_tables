module PrimeTables
  class EratosthenesSieve
    PRIME_CAP = 1299709
    OMITS = [0, 1]
    attr_reader :count

    class << self
      def first(n)
        new(n).compute_primes
      end
    end

    def initialize(count)
      @count = count
    end

    def compute_primes
      validate_count!
      [].tap do |primes|
        numbers.each do |num|
          if OMITS.include?(num)
            numbers[num] = nil
            next
          end
          next unless num
          nullify_products(num)
          primes << num
          break if primes.length >= count.to_i
        end
      end
    end

    private

    def validate_count!
      if count.to_i < 1
        raise Errors::InvalidNumber.new("Argument must be a number greater than 0. You provided: '#{count}'")
      end
    end

    def nullify_products(num)
      num.step(PRIME_CAP, num).with_index do |product_as_index, i|
        next if i == 0
        numbers[product_as_index] = nil
      end
    end

    def numbers
      @numbers ||= (0..PRIME_CAP).to_a
    end
  end
end
