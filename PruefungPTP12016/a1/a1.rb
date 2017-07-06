#TODO Naeherung fuer Math.log(x) fuer x > 0.5 iterativ (5Pkt)

def ln_i(x,n)
  raise ArgumentError, 'Die Parameter sind vom falschen Typ' unless x.is_a?(Numeric) && n.is_a?(Integer)
  raise ArgumentError, 'DIe Parameter ligen nicht im zulaessigen Wertebereich' unless x > 0.5 && n > 0  
  return 0 if x == 1
  (1..n).inject(0) { |akku, i|
    elem = (x - 1) ** i / (i * x ** i).to_f
    akku + elem
  }
end

#TODO Naeherung fuer Math.log(x) fuer x > 0.5 rekursiv (5Pkt)

def ln_r(x,n)
  raise ArgumentError, 'Die Parameter sind vom falschen Typ' unless x.is_a?(Numeric) && n.is_a?(Integer)
  raise ArgumentError, 'DIe Parameter ligen nicht im zulaessigen Wertebereich' unless x > 0.5 && n > 0
  return 0 if x == 1
  
  return (x - 1).to_f / x if n == 1
  ln_r(x,n-1) + ((x - 1) ** n) / (n * x ** n).to_f
end

# TODO Methode deep_group_by_class fuer Arrays 1Pkt
# 10 Pkt

# 10 Pkt  // 8 Pkt fuer korrekte Loesung mit each
# TODO Methode multi_value_reverse auf Hash
def multi_value_reverse(h)
end

puts ln_i(2,500)
puts Math.log(2)

