def geo_reihe(x, n, accu = 1)
  # make sure x, n are valid
  raise ArgumentError, 'Die Parameter sind vom falschem Typ' unless x.is_a?(Numeric) && n.is_a?(Integer)
  raise ArgumentError, 'Die Parameter liegen nicht im zulässigen Wertebereich' if x.abs >= 1 || n < 0
  
  return accu if n == 0               # base case
  geo_reihe(x, n - 1, accu + x ** n)  # recursive case 
end

def reverse_rek(ary, accu = [])
  # check parameter
  raise ArgumentError, 'Der Parameter ist nicht vom Typ Array' unless ary.is_a?(Array)
    
  return accu if ary.empty?                      # base case
  reverse_rek(ary.drop(1), ary.first(1) + accu)  # recursive case  
end

puts geo_reihe(0.6,100)              # ~ 2.5

ary = [1,[1,22,[5,7,0],8],2,3]
puts "#{reverse_rek(ary)}"            # [3, 2, [1, 22, [5, 7, 0], 8], 1]