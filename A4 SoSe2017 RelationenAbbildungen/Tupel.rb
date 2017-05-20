class Tupel
  

  def initialize(a,b)
    @a = a
    @b = b
  end

  attr_reader :a, :b
  
  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    @a == other.a && @b == other.b
  end

  def eql?(other)
    self == other
  end

  def hash
    @a.hash + @b.hash
  end

  def to_s()
    "(#{@a},#{@b})"
  end
end

# t = Tupel.new(3,5)
# t1 = Tupel.new(3,5)
# puts t == t1

