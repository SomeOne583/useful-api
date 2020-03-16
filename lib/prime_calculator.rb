class PrimeCalculator
    def initialize(amount)
        @primes = []
        find_primes(amount)
    end

    def find_primes(amount)
        n = 1
        while @primes.size < amount
            n += 1
            next if (n % 2 == 0 && n != 2)
            @primes << n if check_prime(n)
        end
        print @primes
    end

    private

    def check_prime(n)
        if n < 4
            return true
        end
        (3).step(Math::sqrt(n).ceil, 2) do
            |i|
            return false if n % i == 0
        end
        return true
    end
end
