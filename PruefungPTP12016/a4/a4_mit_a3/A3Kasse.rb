class Kasse
  attr_reader :rechnungen
  protected :rechnungen

  # TODO Initialisierung ihrer Loesung aus a3
  # Gegeben
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

  # TODO Initialisierung ihrer Loesung aus a3
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

  # TODO Initialisierung ihrer Loesung aus a3
  def to_s()
    return "#{@produkt}:#{preis}"
  end
end

