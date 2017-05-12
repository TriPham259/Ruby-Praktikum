require "Set"

# Änderungen an der Klasse Set für eine bessere Darstellung
# und korrektem Inhaltsvergleich für Mengen von Mengen

class Set

  def ==(other)
    return false if other.nil?()
    return true if self.equal?(other)
    return self.all?(){|e| other.include?(e)}
  end

  def eql?(other)
    return false if other.nil?()
    return true if self.equal?(other)
    return self.all?(){|e| other.include?(e)}
  end

  def hash()
    prime = 31
    return self.inject(1){|acc,x|
      prime*acc + x.hash()
    }
  end

  def to_s() 
    return "Set{}" if size() == 0
    r= "Set{#{self.map(){|x| x }}}"
    r[-2,r.size()-1] = r[-1,r.size()-1]
    return r
  end
end


class Potenzmenge
  
  include Enumerable
  
  def initialize(a_set)

    @potenz = Set.new(a_set.inject(Set.new().add(Set.new())){|acc,s|
      r = Set.new()
      acc.each(){|set| r.add(set);  r.add(set.clone().add(s)) }
      r
    })
  end

  def each(&b)
    @potenz.each(&b)
  end

  def to_s
    return "#{@potenz}"
  end

  def inspect
    @potenz.inspect()
  end
  
  def size()
    return @potenz.size()
  end
end

p = Potenzmenge.new(Set.new([1,2,3,4]))

puts p
