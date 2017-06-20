class Point
  def initialize(x,y)
    @x = x
    @y = y
  end
  
  def x
    return @x
  end
  def y
      return @y    
  end
  def + (point)
    @x = @x+point.x
    @y = @y+point.y
    return self
  end
  
  def to_s()
      return "Point(#@x,#@y)"    
  end
end