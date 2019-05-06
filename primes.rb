#
# Find all primes less than or equal to positive integer n
#
def primes(n)

  # Base cases
  return [] if n <= 1
  return [2] if n== 2

  # Now look only at odd numbers
  primes = [2]
  i = 3

  while i <= n do
    is_prime = true
    primes.each do |p|
      if (i % p == 0)
        is_prime = false
        break
      end
    end
    primes << i if is_prime
    i += 2
  end
  puts "PRIMES == #{primes.inspect}"
  primes
end

