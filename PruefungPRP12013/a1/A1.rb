# TODO Naeherung fuer 1/4 iterativ
# Summe 5 PKt

def f_1_4tel_it(n)
  return false if !n.is_a?(Integer) || n < 1

  result = 0;

  1.upto(n) { |i|
    result += 1.0 / (i * (i+1) * (i+2))
  }

  result
end

# TODO Naeherung fuer 1/4 rekursiv
# Summe 5 Pkt
def f_1_4tel_rek(n)
  return false if !n.is_a?(Integer) || n < 1

  # base case
  return 1.0 / (1 * (1+1) * (1+2)) if n == 1

  # general case
  1.0 / (n * (n+1) * (n+2)) + f_1_4tel_rek(n - 1)
end

# TODO Array erweitern ary_min_e_elems
# Summe 10 Pkt

class Array 
  def ary_min_2_elems
    @@result = 0 
    if self.size >= 2 
      @@result = 1
    end
    @@result += ary_min_2_elems_intern(self)
    @@result 
  end
  
  private  
  def ary_min_2_elems_intern(ary)
    result = 0
    ary.each { |elem|
      if elem.is_a?(Array)
        if elem.size >= 2
          result += ary_min_2_elems_intern(elem) + 1
        else
          result += ary_min_2_elems_intern(elem) + 0
        end
      end
    }
    result
  end
end

# TODO  Methode organisiere_nach_wert(a_hash) 6 Pkt

require "Set"

class Set 
  def to_s 
    return 'Set {}' if size == 0
    set = "Set {#{map{|x| x}}}"
    set.delete('[]')
  end
end

def organisiere_nach_wert(a_hash)
  result = {}
  a_hash.each { |key, val|
    val.each { |v| 
      result[v] = Set.new if !result.has_key?(v)
      result[v].add(key)
    }
  }
  result
end

# TODO Methode schluessel_pro_wert(h) 4 Pkt
def schluessel_pro_wert(a_hash)
  result = {}
  a_hash.each { |key, val|
    val.each { |v| 
      result[v] = 0 if !result.has_key?(v)
      result[v] += 1
    }
  }
  result
end













