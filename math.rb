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
  #puts "PRIMES == #{primes.inspect}"
  primes
end

class Integer

  #
  # Find all factors of positive integer n
  #
  def factors
    factors = []
    i = 1
    sqrt = ((self.to_f)**0.5).to_i
    for i in (1..sqrt) do
      if self % i == 0
        factors << i
        factors << self / i
      end
    end
    #puts "FACTORS == #{factors.inspect}"
    factors
  end

  #
  # Find the prime factorization of positive integer n
  # 
  # FYI: primes_factors(n).inject(:*) == n
  #
  def prime_factors
    sqrt = self**(0.5)
    all_primes = primes(sqrt)
    factors = []
    all_primes.each do |p|
      power = 1
      while self % (p**power) == 0
        factors << p
        power += 1
      end
    end
    #puts "PRIME FACTORIZATION == #{factors}"
    factors
  end

  #
  # binomial coefficient: n C k
  #
  def choose(k)
    # n!/(n-k)!
    top = (self-k+1 .. self).inject(1, &:*)
    # k!
    bottom = (2 .. k).inject(1, &:*)
    top / bottom
  end

  #
  # binomial coefficient: n C k mod p (p is prime)
  # 
  def mod_choose(k,p)
    result = 1
    for i in (self-k+1 .. self) do
      result = (result * i) % p
    end
    for i in (2 .. k) do
      result = (result * modinv(i,p)) % p
    end
    result
  end
end

def modinv(a, m) # compute a^-1 mod m if possible
  raise "NO INVERSE - #{a} and #{m} not coprime" unless a.gcd(m) == 1
  return m if m == 1
  m0, inv, x0 = m, 1, 0
  while a > 1
    inv -= (a / m) * x0
    a, m = m, a % m
    inv, x0 = x0, inv
  end
  inv += m0 if inv < 0
  inv
end

def fibonacci(n)
  sqrt_five = 5**0.5
  phi = (sqrt_five + 1.0)/2.0
  ((phi**n - (-phi)**(-n))/sqrt_five).round
end
