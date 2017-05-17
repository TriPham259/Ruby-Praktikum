class Tupel
  attr_reader :a, :b

  def initialize(a,b)
    @a = a
    @b = b
  end

  def to_s()
    "(#{@a},#{@b})"
  end
end

