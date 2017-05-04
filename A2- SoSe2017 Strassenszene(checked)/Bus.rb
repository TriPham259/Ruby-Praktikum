require 'Rechteck'
require "Kreis"

class Bus
 #TODO
  def initialize()
  
      @fahrgestell = Rechteck.new(0,100,100,25)
      @kabine      = Rechteck.new(0,50,70,50)
      @fenster     = []
      fenster_anzahl = 3
      for i in (0...fenster_anzahl)
        fenster_pos_x  = 2.5 + i*(20+2.5)
        fenster_pos_y  = 55
        fenster_laenge = 20
        fenster_hoehe  = 45
           @fenster<<Rechteck.new(fenster_pos_x, fenster_pos_y, fenster_laenge, fenster_hoehe, :white)
      end
      @raeder = []
      raeder_anzahl = 2
      for i in (0...raeder_anzahl)
        kreis_pos_x  = 15 + i*68
        kreis_pos_y  = 125
        kreis_radius = 10
        @raeder<< Kreis.new(kreis_pos_x, kreis_pos_y, kreis_radius, :red)
      end
   end
  

  def sichtbar_machen()
        @fahrgestell.sichtbar_machen()
        @kabine.sichtbar_machen()
  
        #for i in(0...@fenster.size)
        @fenster.each{|fenster|
        fenster.sichtbar_machen
  }
        # end
  
       # for i in (0...@raeder.size)
  @raeder.each{|raeder|
  raeder.sichtbar_machen()}
       # end
  end

 def hoehe()
    return @fahrgestell.hoehe + @kabine.hoehe + @raeder[0].radius
 end

 def breite()
    return @fahrgestell.breite
 end

 def position()
   return @fahrgestell.obere_linke_ecke + Point.new(0,@fahrgestell.hoehe+@raeder[0].radius)
 end

 def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fahrgestell.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @kabine.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    for i in (0...@fenster.size)
    @fenster[i].bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    end
    for i in (0...@raeder.size)
    @raeder[i].bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    end
 end

  def auf_position_setzen(ziel_pos_x,ziel_pos_y)
    delta_x = ziel_pos_x - position.x
    delta_y = ziel_pos_y - position.y
    bewegen(delta_x,delta_y,1,0,0)
  
  end

  def nach_vorne_fahren(wdh,wdh_nach,starten_nach)
    bewegen(1,0,wdh,wdh_nach,starten_nach)
  end

  def nach_hinten_fahren(wdh,wdh_nach,starten_nach)
    bewegen(-1,0,wdh,wdh_nach,starten_nach)
  end

  def nach_unten_fahren(wdh,wdh_nach,starten_nach)
   bewegen(0,1,wdh,wdh_nach,starten_nach)
  end

  def nach_oben_fahren(wdh,wdh_nach,starten_nach)
   bewegen(0,-1,wdh,wdh_nach,starten_nach)
  end

  def einparken(x_links,x_rechts,y)
 
     mitte_x = (x_links + x_rechts)/2
     delta_x = mitte_x - (position.x + breite/2)
     delta_y = y - (position.y  )                            #10 is the radius of the tire
     if delta_x > 0                                                             #fahre vorne while the ziel position is further than the actual position 
     nach_vorne_fahren(delta_x,10,0)
     else
     delta_x = -delta_x
     nach_hinten_fahren(delta_x,10,0)
     end 
     if delta_y >0
     nach_unten_fahren(delta_y,10,delta_x*10+50)
     else
     delta_y = -delta_y
     nach_oben_fahren(delta_y,10,delta_x*10+50)
     end

   end

  def ausparken(fahrlinie)
    delta_y = fahrlinie - (position.y )
    if delta_y > 0
    nach_unten_fahren(delta_y,10,0)
    else
    delta_y = -delta_y
    nach_unten_fahren(delta_y,10,0)
    end
  end

  def abdunkeln()
  
   #for i in(0...@fenster.size)
    @fenster.each{|fenster|
    fenster.farbe_aendern("grau")
  }
    #end
    @fahrgestell.farbe_aendern("hellgrau")
    @kabine.farbe_aendern("hellgrau")
   
    @raeder.each{|raeder|
    #for i in (0...@raeder.size)
    raeder.farbe_aendern("hellgrau")
    }
    #end
  
  end

  def in_farbe_aendern()
    @fenster.each{|fenster|
    #for i in(0...@fenster.size)
    fenster.farbe_aendern("weiss")
    }
    #end
    @fahrgestell.farbe_aendern("blau")
    @kabine.farbe_aendern("blau")
    @raeder.each{|raeder|
    #for i in (0...@raeder.size)
    raeder.farbe_aendern("rot")
    }
    #end
  end


 end