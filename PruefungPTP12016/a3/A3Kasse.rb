# 25 Pkt fuer Loesung Aufgabenteil A
# 5 Pkt fuer Loesung Aufgabenteil B

class Kasse

  # Gegeben
  attr_reader :rechnungen
  attr_writer :rechnungen
  protected :rechnungen

  # TODO 's nach Aufgabenstellung
  def initialize
    @rechnungen = []
  end
  
  def clone
    @rechnungen.map { |rechnung| rechnung.clone}
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    self.rechnungen == other.rechnungen
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    self.rechnungen.eql?(other.rechnungen)
  end

  def hash
    @rechnungen.hash
  end

  # Gegeben
  def <<(rechnung)
    @rechnungen << rechnung
    return self
  end

  def size()
    return @rechnungen.size()
  end

  def to_s()
    return "Kasse:\n #{@rechnungen.join("\n ")}}"
  end
end

class Rechnung
  # Gegeben
  attr_reader :positionen,:nr
  attr_writer :positionen
  protected :positionen

  # TODO 's nach Aufgabenstellung
  def initialize(nr)
    @nr = nr
    @positionen = []
  end
  
  def clone
    cloned = super
    cloned.positionen = @positionen.map{ |pos| pos.clone}
      
    cloned
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    [self.nr, self.positionen] == [other.nr, other.positionen]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    [self.nr, self.positionen].eql?([other.nr, other.positionen])
  end

  def hash
    @nr.hash + @positionen.hash
  end

  # Gegeben
  def <<(pos)
    @positionen << pos
    return self
  end

  def to_s(abbr=false)
    if abbr
      return "R#{@nr}"
    end
    return "R#{@nr}:#{@positionen.join(",")}"
  end
end

# 5 Pkt
class Position

  attr_reader :preis
  # Gegeben
  def produkt
    @produkt.clone()
  end

  # TODO 's nach Aufgabenstellung

  def initialize(produkt, preis)
    @produkt = produkt
    @preis = preis
  end
  
  def clone
    cloned = super
    cloned.produkt
    
    cloned
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    [self.produkt, self.preis] == [other.produkt, other.preis]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    [self.produkt, self.preis].eql?([other.produkt, other.preis])
  end

  def hash
    @produkt.hash + @preis.hash
  end

  def to_s()
    return "#{@produkt}:#{preis}"
  end
end

