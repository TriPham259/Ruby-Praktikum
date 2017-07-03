# 25 Pkt fuer Loesung Aufgabenteil A
# 5 Pkt fuer Loesung Aufgabenteil B

class Kasse

  # Gegeben
  attr_reader :rechnungen
  protected :rechnungen

  # TODO 's nach Aufgabenstellung
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
  protected :positionen

  # TODO 's nach Aufgabenstellung

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

  def to_s()
    return "#{@produkt}:#{preis}"
  end
end

