require_relative "a1"

puts "Naeherung fuer ln(x) x > 0.5"

x = 0.51 # x=2
for i in 1..30
  puts "Math.log(#{x})-ln_r(#{x},#{i}):#{Math.log(x)}-#{ln_r(x,i)}:#{Math.log(x)-ln_r(x,i)}"
  puts "Math.log(#{x})-ln_i(#{x},#{i}):#{Math.log(x)}-#{ln_i(x,i)}:#{Math.log(x)-ln_i(x,i)}"
end

