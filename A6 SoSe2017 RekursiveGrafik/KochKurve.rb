require "tk"
require "Turtle"
require "Point"

class KochKurve

  # Bei der Initialisierung werden mit wdhl die Anzahl der rekursiven Aufrufe festgelegt, 
  # mit x,y die Anfangsposition der Turtle und
  # mit kl die Kantenlänge festgelegt
  #
  # Der Drehwinkel ist eine für die Kochkurve feste Größe von 60 im Gradmass
  
  def zeichnen(wdhl,x,y,kl)
    @turtle = Turtle.new(x,y,0)
    @angle = 60
    @factor = 3.0
    koch(wdhl,kl)
  end

  # Löscht alle Zeichnungen der Turtle
  def loeschen()
    @turtle.loeschen()
  end

  # rekursive Funktion zum Zeichnen der Kochkurve
  def koch(n,kl)
    # Abbruchbedingung: Alle Ersetzungen wurden abgeschlossen
    # jetzt können die verkürzten Strecken gezeichnet werden
    if n == 0
      @turtle.go_ahead(kl)
      return
    end
    # Rekursiver Aufruf - Anwendung der Ersetzungsregel: F -> F+F--F+F
    koch(n-1,(kl/@factor).round)             # F
    @turtle.turn_left(@angle)                # +
    koch(n-1,(kl/@factor).round)             # F
    @turtle.turn_right(@angle)               # -
    @turtle.turn_right(@angle)               # -
    koch(n-1,(kl/@factor).round)             # F
    @turtle.turn_left(@angle)                # +
    koch(n-1,(kl/@factor).round)             # F
  end

end