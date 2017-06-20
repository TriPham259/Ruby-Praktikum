require "Turtle"

class McWorterPentigree
  def initialize
    @angle = 36
    @factor = (3 - Math.sqrt(5))/2
  end
=begin
  Startsymbol = F
  P = {F → +F++F----F--F++F++F-}
  Drehwinkel = 36°
  Verkürzungsfaktor = (3 - √5) / 2
=end

  def loeschen()
    @turtle.loeschen()
  end
  
  def zeichnen(n,x,y,kl)
    @turtle = Turtle.new(x,y)
    penti(n,kl)
  end

  #  P = {F → +F++F----F--F++F++F-}

  def penti(n,kl)
  end
end