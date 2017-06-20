class HilbertKurve
 
  # Die Methode, die die rekursive Vorschrift zur Konstruktion der Hilbertkurve umsetzt
  # wdhl: gibt den Grad der Kurve an
  # x,y: Startposition für den Zeichenstift
  #      eine gute Startposition für x ist die Hälfte der Leinwandbreite/ für y 500 
  # kl: Kantenlänge für das Zeichnen für n==0 sollte eine kleine Größe sein (z.B. 2)
  def zeichnen(wdhl,x,y,kl)
    # Turtle ist eine Zeichenwerkzeug, das zu Beginn auf Position x,y gesetzt wird
    @turtle = Turtle.new(x,y)
    hilbert_x_zeichnen(wdhl,kl)
  end

  # NICHT ANFASSEN
  def loeschen()
    @turtle.loeschen()
  end

  # Vorschrift:
  # initiator = "X" (s. Ordnung 1)
  # generatorX = "L Y F R X F X R F Y L"
  # generatorY = "R X F L Y F Y L F X R"
  def hilbert_x_zeichnen(wdhl,kl)
  end


end