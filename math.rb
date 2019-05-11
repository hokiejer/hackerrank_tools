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

  sqrt = n**(0.5)
  all_primes = primes(sqrt)
  factors = []
  all_primes.each do |p|
    power = 1
    while n % (p**power) == 0
      factors << p
      power += 1
    end
  end
  puts "FACTORS == #{factors}"
  factors
end


def combination(n,r)
  numerator = 1
  for i in (r+1)..n do
    numerator = (numerator * i)
  end
  denominator = 1
  for i in 1..(n-r) do
    denominator = (denominator * i)
  end
  #puts "numerator == #{numerator}, denominator == #{denominator}"
  #puts numerator / denominator
  #puts denominator
  (numerator / denominator)
end
