require "Rechteck"
require "Leinwand"

class Strasse
#  TODO
  def initialize(strasse_pos_x,strasse_pos_y, strasse_laenge, strasse_breite)
         
          @fahrbahn = Rechteck.new(strasse_pos_x, strasse_pos_y, strasse_laenge, strasse_breite,:grey)
          
          @mittelstreifen = []
          streifen_pos_y        = strasse_pos_y + strasse_breite/2-3
          streifen_laenge       = strasse_laenge/20
          anzahl_mittelstreifen = 10
          streifen_breite       = 5
          for i in (0...anzahl_mittelstreifen)
          streifen_pos_x        = strasse_pos_x+i*strasse_laenge/10
          
          @mittelstreifen<< Rechteck.new(streifen_pos_x, streifen_pos_y, streifen_laenge, streifen_breite, :white)
          end 
   
  end
    
  
  def laenge()
     return @fahrbahn.breite
  end
  
  def breite()
     return @fahrbahn.hoehe
  end
  
  def oben_links_x()
     return @fahrbahn.obere_linke_ecke.x
  end
 
  def oben_links_y()
      return @fahrbahn.obere_linke_ecke.y
  end
    
  def unten_links_y()
      return @fahrbahn.obere_linke_ecke.y+breite
  end
    
  
 
  def sichtbar_machen()
     @fahrbahn.sichtbar_machen()
   @mittelstreifen.each{|streifen|
     #for i in (0...@mittelstreifen.size)
     streifen.sichtbar_machen
   }
     #end
   
  end
 
  def abdunkeln()
      @fahrbahn.farbe_aendern("schwarz")
      @mittelstreifen.each() {|streifen|
        streifen.farbe_aendern("hellgrau")
      }
#    for i in (0...@mittelstreifen.size)
#      @mittelstreifen[i].farbe_aendern("hellgrau")
#    end
  end
  
 def in_farbe_aendern()
      @fahrbahn.farbe_aendern("grau")
    @mittelstreifen.each{|streifen|
      #for i in (0...@mittelstreifen.size)
      @mittelstreifen[i].farbe_aendern("weiss")
 }
      #end
 end    
   
end