class Raum
  include Comparable
  attr_reader :gegenstaende
  protected :gegenstaende
  def initialize(gegenstaende)
    @gegenstaende = gegenstaende
  end

  def clone
    g_clones = @gegenstaende.map(){|g| g.clone()}
    return Raum.new(g_clones)
  end

  # Ergänzungen nach Aufgabenstellung 15Pkt
  # TODO
  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    @gegenstaende == other.gegenstaende
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    @gegenstaende.eql?(other.gegenstaende)
  end

  def hash
    @gegenstaende.hash
  end

  def <=>(other)
    gegenstaende <=> other.gegenstaende
  end

  def to_s()
    "R(#{@gegenstaende.join().strip()})"
  end
end

class Gegenstand
  include Comparable
  attr_reader :gewicht,:lebenspunkte
  def initialize(gewicht,lebenspunkte)
    @gewicht = gewicht
    @lebenspunkte = lebenspunkte
  end

  # Ergänzungen nach Aufgabenstellung 15Pkt
  # TODO
  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@gewicht, @lebenspunkte] == [other.gewicht, other.lebenspunkte]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@gewicht, @lebenspunkte].eql?([other.gewicht, other.lebenspunkte])
  end

  def hash
    @gewicht.hash + @lebenspunkte.hash
  end

  def <=>(other)
    [@lebenspunkte, @gewicht] <=> [other.lebenspunkte, other.gewicht]
  end

  def to_s()
    "G(#{gewicht},#{lebenspunkte})"
  end
end

# Wird nur benötigt für die Testdaten
class Welt
  def initialize(n,m)
    @flaeche = Array.new(n){Array.new(m)}
  end
end

#g1 = Gegenstand.new(3,3)
#g2 = Gegenstand.new(2,2)
#g3 = Gegenstand.new(1,4)
#g4 = Gegenstand.new(1,3)
#g5 = Gegenstand.new(7,2)
#g6 = Gegenstand.new(2,5)
#r1 = Raum.new([g1, g2, g3, g4])
#r2 = Raum.new([g5, g6])
#puts [g5, g6]
#puts [g1, g2, g3, g4].sort
#puts [r2, r1, r2, r2, r1].sort