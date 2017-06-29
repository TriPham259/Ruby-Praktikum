require "Turtle"
class GosperKurve
  
  def initialize
      @angle = 60
      @factor = 2
    end

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
    # Abbruchbedingung
    if n == 0
      @turtle.go_ahead(kl)
      return
    end
    
    # Rekursiver Aufruf X → X+YF++Y F-F X-- FX FX -YF+
    x(n - 1, (kl / @factor).round) # X
    @turtle.turn_left(@angle) # +
    y(n - 1, (kl / @factor).round) # Y
    @turtle.go_ahead(kl) # F
    @turtle.turn_left(@angle) # +
    @turtle.turn_left(@angle) # +
    y(n - 1, (kl / @factor).round) # Y
    @turtle.go_ahead(kl) # F
    @turtle.turn_right(@angle) # -
    @turtle.go_ahead(kl) # F
    x(n - 1, (kl / @factor).round) # X
    @turtle.turn_right(@angle) # -
    @turtle.turn_right(@angle) # -
    @turtle.go_ahead(kl) # F
    x(n - 1, (kl / @factor).round) # X 
    @turtle.go_ahead(kl) # F
    x(n - 1, (kl / @factor).round) # X
    @turtle.turn_right(@angle) # -
    y(n - 1, (kl / @factor).round) # Y
    @turtle.go_ahead(kl) # F
    @turtle.turn_left(@angle) # +
  end
  
  def y(n,kl)
    # Abbruchbedingung
    if n == 0
      @turtle.go_ahead(kl)
      return
    end
    
    # Rekursiver Aufruf Y → -FX+ YFYF ++ Y F+FX--FX-Y
    @turtle.turn_right(@angle) # -
    @turtle.go_ahead(kl) # F
    x(n - 1, (kl / @factor).round) # X
    @turtle.turn_left(@angle) # +
    y(n - 1, (kl / @factor).round) # Y
    @turtle.go_ahead(kl) # F
    y(n - 1, (kl / @factor).round) # Y
    @turtle.go_ahead(kl) # F
    @turtle.turn_left(@angle) # +
    @turtle.turn_left(@angle) # +
    y(n - 1, (kl / @factor).round) # Y
    @turtle.go_ahead(kl) # F
    @turtle.turn_left(@angle) # +
    @turtle.go_ahead(kl) # F
    x(n - 1, (kl / @factor).round) # X
    @turtle.turn_right(@angle) # -
    @turtle.turn_right(@angle) # -
    @turtle.go_ahead(kl) # F
    x(n - 1, (kl / @factor).round) # X
    @turtle.turn_right(@angle) # -
    y(n - 1, (kl / @factor).round) # Y
  end
  
  
  
end