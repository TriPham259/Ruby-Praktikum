# TODO Naeherung fuer ln(x) iterativ
# Summe 5 PKt
def ln_iter(x,n)
  return false unless x.is_a?(Numeric) && x > 0 && n.is_a?(Integer) && n >= 0

  result = 0

  0.upto(n){ |i|
    result += (x - 1.0) ** (2*i + 1) / ((2*i + 1) * (x + 1) ** (2*i + 1))
  }

  result
end

# TODO Naeherung fuer ln(x) (Math.log(x)) rekursiv
# Summe 5 Pkt
def ln_rek(x,n)
  return false unless x.is_a?(Numeric) && x > 0 && n.is_a?(Integer) && n >= 0

  # base case
  return (x - 1.0) / (x + 1) if n == 0

  # recursive case
  return ln_rek(x,n - 1) + (x - 1.0) ** (2*n + 1) / ((2*n + 1) * (x + 1) ** (2*n + 1))
end

# TODO erweiteren collect_ary_plus_depth
# Summe 10 Pkt
class Array
  def collect_ary_plus_depth
    collect_ary_plus_depth_intern(self)
  end

  def collect_ary_plus_depth_intern(ary, depth = 0)
    result = [[depth,ary]]
    ary.each { |elem|
      if elem.is_a? Array
        result += collect_ary_plus_depth_intern(elem, depth+1)
      end
    }
    result
  end
end

# TODO Hash verknuepfen und auf injektiv pruefen
# Summe 10
class Hash
  def verknuepfe(other_hash)
    result = {}
    self.each { |k1, v1|
      other_hash.each { |k2, v2|
        result[k1] = v2 if v1 == k2
      }
    }
    result
  end

  def injektiv?
    result = {}
    self.each { |k, v|
      result[v] = [] if !result.has_key?(v)
      result[v] << k

    }
    !result.any? { |k, v|
      v.size > 1
    }
  end
end

#puts ln_iter(2,10)
#puts ln_rek(2,10)
#puts Math.log(2)

#print [1,[2,[3]]].collect_ary_plus_depth

#print ({ 1 => 4, 2 => 7, 3 => 7 }).verknuepfe( { 4 => 9, 7 => 13, 9 => 14 } )
print ({1=>4, 2=> 7, 3=>7}).injektiv?
