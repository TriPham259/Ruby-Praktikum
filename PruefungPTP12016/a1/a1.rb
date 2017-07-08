#TODO Naeherung fuer Math.log(x) fuer x > 0.5 iterativ (5Pkt)

def ln_i(x,n)
  # check type and range of parameters
  raise ArgumentError, 'Die Parameter sind vom falschen Typ' unless x.is_a?(Numeric) && n.is_a?(Integer)
  raise ArgumentError, 'DIe Parameter ligen nicht im zulaessigen Wertebereich' unless x > 0.5 && n > 0

  # loop calc for general case
  (1..n).inject(0) { |akku, i|
    elem = (x - 1) ** i / (i * x ** i).to_f
    akku + elem
  }
end

#TODO Naeherung fuer Math.log(x) fuer x > 0.5 rekursiv (5Pkt)

def ln_r(x,n)
  # check type and range of parameters
  raise ArgumentError, 'Die Parameter sind vom falschen Typ' unless x.is_a?(Numeric) && n.is_a?(Integer)
  raise ArgumentError, 'DIe Parameter ligen nicht im zulaessigen Wertebereich' unless x > 0.5 && n > 0

  # base case
  return (x - 1).to_f / x if n == 1

  # recursive case
  ln_r(x,n-1) + ((x - 1) ** n) / (n * x ** n).to_f
end

# TODO Methode deep_group_by_class fuer Arrays 1Pkt
# 10 Pkt
class Array
  # creat new result-Hash for 1-time use (not in functionalities of recursive method)
  @@dgbc_result = {}

  def deep_group_by_class
    # base case
    return {} if self == []

    # recursive case
    self.each { |elem|
      # create new "Type-hash-pair" for the first time encountering a new Type
      type = elem.class
      @@dgbc_result[type] = [] unless @@dgbc_result.has_key?(type)

      # add elem in corresponding Hash-value
      @@dgbc_result[type] << elem

      # if elem is Array, do again
      elem.deep_group_by_class if elem.is_a?(Array)
    }

    # return
    # Hash[@@dgbc_result.map {|k, v| [k.to_sym,v]}].to_s.delete(':')
    @@dgbc_result
  end
end

# 10 Pkt  // 8 Pkt fuer korrekte Loesung mit each
# TODO Methode multi_value_reverse auf Hash
def multi_value_reverse(h)
  # check Type of parameter
  raise ArgumentError, 'Der Parameter ist kein Hash' unless h.is_a?(Hash)

  # result is a Hash
  result = {}

  # search through arrays of Hash-value
  h.each { |k,v|
    v.each { |el|
      # create new Hash-pair when encountering new elem
      result[el] = [] unless result.has_key?(el)

      # add the corresponding key into Hash-value
      result[el] << k
    }
  }

#  h.each { |k,v|
#    result[v] ||= [] # result[v] = result[v] || result[v] = []
#    result[v] << k
#  }

  result
end

#puts ln_i(2,500)
#puts Math.log(2)
#
#puts [1,2].class
#nested_ary = [[[[1]]], 8, {7 => "einzeln", 5 => [13]}]
#puts nested_ary.deep_group_by_class
#ary = []
#puts ary.deep_group_by_class

#h = {:best1 => [:thetas, :myo, :hololens],
#:best2 => [:gear_360, :soli, :vive] ,
#:best3 => [:thetas, :gear_360, :myo] }
#puts multi_value_reverse(h)

