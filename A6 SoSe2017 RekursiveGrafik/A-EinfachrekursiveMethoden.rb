def geo_reihe(x, n)      # ~ 1/(1-x)
  # make sure parameters are valid
  raise ArgumentError, 'Die Parameter sind vom falschen Typ' unless x.is_a?(Numeric) && n.is_a?(Integer)
  raise ArgumentError, 'Die Parameter liegen nicht im zulässigen Wertebereich' if x.abs >=1 || n < 0
  
  return 1 if n == 0            # base case
  geo_reihe(x, n - 1) + x ** n  # recursive case 
end

def reverse_rek(ary)
  # check parameter
  raise ArgumentError, 'Der Parameter ist nicht vom Typ Array' unless ary.is_a?(Array)
  
  return ary if ary.size == 1              # base case
  reverse_rek(ary.drop(1)) + ary.first(1)  # recursive case
end

def deep_reverse(ary)
  raise ArgumentError, 'Der Parameter ist vom falschem Typ' unless ary.is_a? Array
  
  result = []
  ary.each { |elem|
    if elem.is_a?(Array)
      result << deep_reverse(elem)
    else
      result << elem
    end
  }
  result.reverse
end

#puts geo_reihe(0.6,100)              # ~ 2.5

#ary = [1,[1,22,[5,7,0],8],2,3]
#puts "#{reverse_rek(ary)}"            # [3, 2, [1, 22, [5, 7, 0], 8], 1]
#puts "#{deep_reverse(ary)}"           # [3, 2, [8, [0, 7, 5], 22, 1], 1]

my_ary = [1, 2, 3, 4]
puts my_ary.drop(1).to_s
print my_ary.first
