# Naeherung für f(a,x) = a^x 3Pkt
#TODO
def f_it(a,x,n)
  result = 0
  0.upto(n) { |i|
    result += Math.log(a) ** i * x**i / fak(i)
  }
  result
end
# Endrekursive Lösung  3Pkt
#TODO
def f_rek(a,x,n,accu=1)
  # base case
  return accu if n == 0
  
  # recursive case
  f_rek(a,x,n-1, accu + Math.log(a) ** n * x**n / fak(n))
end
# Vorgegeben 
def fak(n)
  return 1 if n==0
  (1..n).inject(:*)
end

# n_fuer_eps  4Pkt
# TODO
def n_fuer_eps(a, x, eps)
  a = 3
  x = 2
  n = 0
  stop = false
  while !stop
    if f_it(a, x, n+1) - f_it(a, x, n) < eps
      stop = true
    else 
      n += 1
    end
  end
  n - 1
end
# max_with_size  10 Pkt
# TODO
class Array
  def max_with_size
    @@max = []
    max_with_size_intern(self)
  end
  
  private 
  def max_with_size_intern(ary)
    @@max = [ary.size, ary] if @@max.empty? || ary.size > @@max[0]
  
    ary.each { |elem|
      max_with_size_intern(elem) if elem.is_a? Array 
    }
    @@max
  end
end

# deep_to_a   10 Pkt
# TODO
class Hash
  def deep_to_a
    deep_to_a_intern(self)
  end
  
  def deep_to_a_intern(a_hash)
    # base case
    return a_hash unless a_hash.is_a? Hash
    
    # recursive case
    a_hash.map { |k, v|
      [deep_to_a_intern(k), deep_to_a_intern(v)]
    }
  end
end

#puts f_it(5,2,10)
#puts f_rek(5,2,10)
#puts n_fuer_eps (1.7763568394002509e-15)
#print deep_to_a({12 => 13, 14=>15})

#my_hash = {8=>{10=> {11=> {12 => 13}}}}
#print my_hash.deep_to_a

#my_ary = [[1,[2,3,4]],[[[5,[6],[7,8,9],10,11]]]]
#my_ary1 = [[5,[6],[7,8,9],10,11]]
#print my_ary.max_with_size
#puts
#print [1,[2,3,4]].max_with_size()
#puts
#print [].max_with_size() 
