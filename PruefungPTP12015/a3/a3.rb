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
    @flaeche[i][j] = raum
  end

  # TODO gesamt 2Pkt
  def raum_an_position(i,j)
    @flaeche[i][j]
  end

  # TODO gesamt: 7 Pkt
  def raum_position(raum)
    @flaeche.each_with_index { |x,i|
      x.each_with_index { |y,j|
        return [i,j] if y == raum
      }
    }
  end

  # TODO gesamt: 4Pkt
  def wegkosten(raum1,raum2)
    (raum_position(raum2)[0] - raum_position(raum1)[0]).abs + (raum_position(raum2)[1] - raum_position(raum1)[1]).abs
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
    @welt.select { |raum|
      erreichbare_ziele.include?(raum) && !raum.empty?
    }.max { |a, b|
      Float(a.wertigkeit)/gesammt_kosten(a) <=> Float(b.wertigkeit)/gesammt_kosten(b)
    }
  end

  # TODO gesamt 6 Pkt
  def erreichbare_ziele()
    @welt.select{ |raum|
      @tragkraft >= raum.kosten && @lebenspunkte >= @welt.wegkosten(@aktueller_raum, raum) && raum != @aktueller_raum
    }
  end

  def gesammt_kosten(raum)
    @welt.wegkosten(@aktueller_raum, raum) + raum.kosten
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
    @gegenstaende << gegenstand
    self
  end

  # TODO 1Pkt
  def size()
    @gegenstaende.size
  end

  # TODO berechnet die Summe der Gewichte der enthaltenen Gegenstaende
  # 3 Pkt
  def kosten()
    self.inject(0){ |akku, gegenstand| akku + gegenstand.gewicht }
  end

  # TODO berechnet die Summe der Lebenspunkte der enthaltenen Gegestaende
  # 3 Pkt
  def wertigkeit()
    self.inject(0){ |akku, gegenstand| akku + gegenstand.lebenspunkte }
  end

  # TODO 1Pkt
  def empty?()
    @gegenstaende.empty?
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

