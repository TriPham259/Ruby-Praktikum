class Kasse
  attr_reader :rechnungen
  protected :rechnungen
  def initialize()
    @rechnungen = []
  end

  def <<(rechnung)
    @rechnungen << rechnung
    return self
  end

  def size()
    return @rechnungen.size()
  end

  def to_s()
    return "Kasse:\n #{@rechnungen.join("\n ")}"
  end

end

class Rechnung
  attr_reader :positionen,:nr
  protected :positionen
  def initialize(nr)
    @nr = nr
    @positionen = []
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

  attr_reader :preis,:produkt
  def initialize(produkt, preis)
    @preis = preis
    @produkt = produkt
  end

  def to_s()
    return "#{@produkt}:#{preis}"
  end
end

