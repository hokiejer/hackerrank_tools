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


#
# Find all factors of positive integer n
#
def factors(n)
  factors = []
  i = 1
  sqrt_n = ((n.to_f)**0.5).to_i
  for i in (1..sqrt_n) do
    if n % i == 0
      factors << i
      factors << n / i
    end
  end
  puts "FACTORS == #{factors.inspect}"
  factors
end

#
# Find all primes factors of positive integer n
#
def prime_factors(n)

  # For all possible prime factors, see if they divide n
  prime_factors = []
  prime_factors << 2 if n > 1
  i = 3
  while i <= n do
    is_prime = true
    primes.each do |p|
      if (i % p == 0)
        is_prime = false
        break
      end
    end
    if is_prime
      power = 1
      while i**power % i == 0
        prime_factors << i
      end
    end
    i += 2
  end
  puts "PRIME FACTORS == #{prime_factors.inspect}"
  prime_factors
end


