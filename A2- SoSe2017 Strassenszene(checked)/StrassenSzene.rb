require "Strasse"
require "Leinwand"
require "StrassenLaterne"
require "Bus"

class StrassenSzene
  def initialize()
    @strasse = Strasse.new(0,250,1000,300)
    @bus =[]
    bus_anzahl = 3
    
    bus_ziel_pos_y = @strasse.unten_links_y - (@strasse.breite/2)-30
   for i in (0...bus_anzahl)
      @bus << Bus.new()
      bus_ziel_pos_x = @strasse.oben_links_x + 80 + i*(150+ @bus[i].breite)
      
      # 150 = diff two bus  100 =bus length  250 tala + berite half vanda ali kati thorai
      @bus[i].auf_position_setzen(bus_ziel_pos_x, bus_ziel_pos_y)
end
    

    @strassenLaterne =[]
    strassenLaterne_anzahl = 4
    for i in (0...strassenLaterne_anzahl)
      @strassenLaterne << StrassenLaterne.new()
      strasse_ziel_pos_x = @strasse.oben_links_x+60+i*(@strassenLaterne[i].breite+200)
      #considered the first gap as 60 and the gap between the lamp as 200  lamp ko length 70 ani 250 chai strase ko y axis

      @strassenLaterne[i].auf_position_setzen(strasse_ziel_pos_x,  @strasse.oben_links_y )
    end

  end

  def sichtbar_machen()
    @strasse.sichtbar_machen
    @bus.each{|bus|
      bus.sichtbar_machen
    }

    @strassenLaterne.each { |laterne|
      laterne.sichtbar_machen
    }
  end

  def in_tag_szene_aendern()
    @strasse.in_farbe_aendern
    @strassenLaterne.each { |laterne|
      laterne.ausschalten
    }
    @bus.each{|bus|
      bus.in_farbe_aendern
    }

  end

  def in_nacht_szene_aendern()
    @strasse.abdunkeln
    @strassenLaterne.each { |laterne|
      laterne.einschalten
    }
    @bus.each{ |bus|
      bus.abdunkeln
    }

  end

  def einparken()
    for i in (0... @bus.size)
      links_x = @strassenLaterne[i].position.x + @strassenLaterne[i].breite
      rechts_x= @strassenLaterne[i+1].position.x
      
      @bus[i].einparken(links_x,rechts_x ,@strasse.oben_links_y)
    end

  end

  def ausparken()
    @bus.each { |bus|
      fahrlinie = @strasse.unten_links_y - (@strasse.breite/2)-10
      bus.ausparken(fahrlinie)

      #strasse.unten ist untere_linke_ecke_y
  }

  end

  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()

  end

end

