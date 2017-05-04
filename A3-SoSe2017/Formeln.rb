def ln(x,n)
  s = 0
  if x > 0.5
    for i in (1..n) do
      s += ((x - 1)**i)/(i * x**i).to_f
    end
    return s
  else
    puts "nicht definiert"
  end
end

def fak(n)
  if n < 0
    puts "nicht definiert"
  elsif n == 0 || n == 1
    return 1
  else
    p = 1
    for i in (2..n) do
      p *= i
    end
    return p
  end
end

def f(a,x,n)
  s = 0
  for i in (0..n) do
    s += (ln(a,1000)**i) * x**i / fak(i)
  end
  return s
end

puts f(2,3,100)