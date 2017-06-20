class LevyFraktal
=begin
  Lévy fractal, aka C-curve
  w = F
  P = F → +F--F+
  δ = 45°
  Verkürzung = 1 / √2
=end
  def initialize()
    @angle = 45
    @factor = Math.sqrt(2)
  end

  def loeschen()
    @turtle.loeschen()
  end

  def zeichnen(n,x,y,kl)
    @turtle = Turtle.new(x,y)
    levy(n,kl)
  end

  #P = { F → +F--F+ } 
  def levy(n,kl)
  end
end