require "Turtle"
class GosperKurve

  def zeichnen(n,x,y,kl)
    @turtle = Turtle.new(x,y)
    x(n,kl)
  end

  def loeschen()
    @turtle.loeschen()
  end
 
  #Peano-Gosper Kurve
  #n = 4
  #axiom = FX
  #X → X+YF++Y F-F X-- FX FX -YF+ 
  #Y → -FX+ YFYF ++ Y F+FX--FX-Y
  #δ = 60°
  def x(n,kl)
  end
  
end