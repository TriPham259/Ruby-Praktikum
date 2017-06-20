require "Turtle"
class DrachenKurve
  
  def zeichnen(n,x,y,kl)
    @turtle = Turtle.new(x,y)
    dl(n,kl)
    puts
  end
 
  def loeschen()
    @turtle.loeschen()
  end
  
  def F(kl)
    print "F"
    @turtle.go_ahead(kl)
  end
  
  def l(angle)
    print "+"
    @turtle.turn_left(angle)
  end
  
  def r(angle)
    print "-"
    @turtle.turn_right(angle)
  end
  

#  P= {                           # Regel für „Zeichnen“ von F  F wird durch sich selbst ersetzt
#          FL -> FL+FR+ ,    # Regel für die linke Drachenkurve
#          FR -> -FL-FR }    # Regel für die rechte Drachenkurve

  def dl(n,kl)
    if n == 0
      F(kl)
      return
    end
    dl(n-1,kl)
    l(90)
    dr(n-1,kl)
    l(90)
  end
  
  #          FR -> -FL-FR }    # Regel für die rechte Drachenkurve
  def dr(n,kl)
    if n==0
      F(kl)
      return
    end
    r(90)
    dl(n-1,kl)
    r(90)
    dr(n-1,kl)
  end

end