def kreuz(n,chars)
  if n % 2 == 1 && n > 0
    for i in (0...n/2) do
      for j in (0...n/2) do 
        print " "*chars.size
      end
      puts chars
    end
    
    for i in (0...n) do
      print chars
    end
    puts
    
    for i in (0...n/2) do
      for j in (0...n/2) do
        print " "*chars.size
      end
      puts chars
    end
  else 
    puts "#{n} muss ungerade und positiv sein."
  end
end

def dreieck1(n,chars)
  if n % 2 == 1 && n > 0
    for i in (0...n) do
      for j in (0..i) do
        print chars
      end
      puts
    end
  else puts "#{n} muss ungerade und positiv sein."
  end
end

def dreieck2(n,chars)
  if n % 2 == 1 && n > 0
    n.downto(0) {|i|
      (n-i).times do
        print " "*chars.size
      end
        
      i.times do
        print chars
      end
          
      puts
    }
  else 
    puts "#{n} muss ungerade und positiv sein."
  end
end

def dreieck3(n,chars)
  if n % 2 == 1 && n > 0
     (n / 2).times do
        print " "*chars.size
     end
     puts chars
     
     for i in (1...n/2) do
       (n / 2 - i).times do
         print " "*chars.size
       end
       print chars
       (2 * i - 1).times do
         print " "*chars.size
       end
       puts chars
     end
     
     n.times do
       print chars
     end
  else 
    puts "#{n} muss ungerade und positiv sein."
  end
end

kreuz(7,"ghk")
  dreieck1(7,"ghk")
  dreieck2(7,"ghk")
  dreieck3(7,"ghk")
