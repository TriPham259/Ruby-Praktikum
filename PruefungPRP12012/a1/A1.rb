# TODO Naeherung fuer ln(x) iterativ
# Summe 5 PKt
def ln_iter(x,n)
  return false unless x.is_a?(Numeric) && x > 0 && n.is_a?(Integer) && n >= 0

  (0..n).inject((x - 1) / (x + 1).to_f) { |sum, i|
    elem = ((x - 1) ** (2 * i + 1)).to_f / ((2 * i + 1) * (x + 1) ** (2 * i + 1))
    sum + elem
  }
end

# TODO Naeherung fuer ln(x) (Math.log(x)) rekursiv
# Summe 5 Pkt
def ln_rek(x,n)
  return false unless x.is_a?(Numeric) && x > 0 && n.is_a?(Integer) && n >= 0

  # base case
  return 2*((x - 1) / (x + 1).to_f) if n == 0 #?

  # recursive case
  return ln_rek(x,n - 1) + ((x - 1) ** (2 * n + 1)).to_f / ((2 * n + 1) * (x + 1) ** (2 * n + 1))
end

# TODO Array erweiteren collect_ary_plus_depth
# Summe 10 Pkt
class Array
  def collect_ary_plus_depth
    collect_ary_plus_depth_intern(self).to_s
  end

  def collect_ary_plus_depth_intern(ary, depth=0)
    raise ArgumentError, 'Der Parameter is vom falschen Typ' unless ary.is_a?(Array)

    result = [depth, ary]
    ary.each { |elem|
      if elem.is_a?(Array)
        result += collect_ary_plus_depth_intern(elem, depth + 1)
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
      other.each { |k2, v2|
        result[k1] = v2 if v1 == k2
      }
    }
    result
  end
end

#puts ln_iter(2,1000)
#puts ln_rek(2,1001)
#puts Math.log(2)

#puts [1,[2,[3]]].collect_ary_plus_depth()

puts {1=>4, 2=> 7, 3=>7}.verknuepfe({4=> 9, 7=> 13, 9=>14})