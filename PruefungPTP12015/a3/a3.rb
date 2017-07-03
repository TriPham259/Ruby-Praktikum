# gesamt  15Pkt
class Welt
  include Enumerable
  #gegeben
  def initialize(n,m)
    @flaeche = Array.new(n){Array.new(m)}
  end
  # gegeben
  def each(&b)
    @flaeche.each(){|korridor|
      korridor.each(){|raum| b.call(raum)}
    }
  end
  # gegeben
  def to_s()
    @flaeche.map(){|korridor| korridor.join("::")}.join("\n")
  end

  # TODO setze_raum gesamt 2 Pkt
  def setze_raum(i,j,raum) #2 Pkt
  end

  # TODO gesamt 2Pkt
  def raum_an_position(i,j)
  end

  # TODO gesamt: 7 Pkt
  def raum_position(raum)
  end

  # TODO gesamt: 4Pkt
  def wegkosten(raum1,raum2)
  end
end

# gesamt 15 Pkt
class Spieler
  # gegeben
  def initialize(name,lebenspunkte,tragkraft,aktueller_raum,welt)
    @name = name
    @lebenspunkte = lebenspunkte
    @tragkraft = tragkraft
    @aktueller_raum = aktueller_raum
    @welt = welt
  end

  # gegeben
  def to_s()
    "Sp(#@name,#@lebenspunkte,#@tragkraft,#@aktueller_raum)"
  end

  # TODO gesamt 9 Pkt
  def optimales_ziel()
  end

  # TODO gesamt 6 Pkt
  def erreichbare_ziele()
  end

end

# gesamt 10 Pkt
class Raum
  include Enumerable
  # gegeben
  def initialize()
    @gegenstaende = Array.new()
  end

  # gegeben Iteriert ueber die Gegenstaende des Raumes
  def each(&b)
    @gegenstaende.each(&b)
  end

  #gegeben
  def to_s()
    "R(#{@gegenstaende.join().strip()})"
  end

  # TODO 2 Pkt
  def <<(gegenstand)
  end

  # TODO 1Pkt
  def size()
  end

  # TODO berechnet die Summe der Gewichte der enthaltenen Gegenstaende
  # 3 Pkt
  def kosten()
  end

  # TODO berechnet die Summe der Lebenspunkte der enthaltenen Gegestaende
  # 3 Pkt
  def wertigkeit()
  end

  # TODO 1Pkt
  def empty?()
  end

end

class Gegenstand
  attr_reader :gewicht,:lebenspunkte
  def initialize(gewicht,lebenspunkte)
    @gewicht = gewicht
    @lebenspunkte = lebenspunkte
  end

  def to_s()
    "G(#{gewicht},#{lebenspunkte})"
  end
end


