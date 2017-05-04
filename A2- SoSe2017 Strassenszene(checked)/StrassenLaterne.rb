require "Kreis"
require "Dreieck"
require "Rechteck"

class StrassenLaterne
  #TODO
  def initialize()
    @schirm = Kreis.new(120,60,40,:orange)
    @stiel = Rechteck.new(116,90,10,80,:green)
    @fuss = Rechteck.new(84,165,70,15,:blue)

    @leuchtstrahl1 = Rechteck.new(90,97,3,25,:yellow)
    @leuchtstrahl2 = Rechteck.new(100,97,3,25,:yellow)
    @leuchtstrahl3 = Rechteck.new(135,97,3,25,:yellow)
    @leuchtstrahl4 = Rechteck.new(145,97,3,25,:yellow)
  end

  def breite()
    return @fuss.breite
  end

  def position()
    return  @fuss.obere_linke_ecke + Point.new(0,@fuss.hoehe)

  end

  def sichtbar_machen()
    @fuss.sichtbar_machen()
    @stiel.sichtbar_machen()
    @schirm.sichtbar_machen()

        if @tag == false
    #if !@tag
      @leuchtstrahl1.sichtbar_machen()
      @leuchtstrahl2.sichtbar_machen()
      @leuchtstrahl3.sichtbar_machen()
      @leuchtstrahl4.sichtbar_machen()
    end
  end

  def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fuss.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @stiel.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @schirm.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl1.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl2.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl3.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @leuchtstrahl4.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
  end

  def auf_position_setzen(ziel_pos_x,ziel_pos_y)
    delta_x = ziel_pos_x - position.x
    delta_y = ziel_pos_y - position.y
    bewegen(delta_x,delta_y,1,0,0)
  end

  def einschalten()
    @schirm.farbe_aendern("gelb")
    @tag = false
    @leuchtstrahl1.farbe_aendern("gelb")
    @leuchtstrahl2.farbe_aendern("gelb")
    @leuchtstrahl3.farbe_aendern("gelb")
    @leuchtstrahl4.farbe_aendern("gelb")
    sichtbar_machen()
  end

  def ausschalten()
    @schirm.farbe_aendern("orange")
    @tag = true
    @leuchtstrahl1.unsichtbar_machen
    @leuchtstrahl2.unsichtbar_machen
    @leuchtstrahl3.unsichtbar_machen
    @leuchtstrahl4.unsichtbar_machen
  end

end
