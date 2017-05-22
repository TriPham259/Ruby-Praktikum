class Kasse
  # TODO
  def initialize()
    #TODO
  end

  def each(&b)
    #TODO
  end

  def produkt_haeufigkeiten()
    #TODO
  end

  # Gegeben
  def <<(rechnung)
    @rechnungen << rechnung
    return self
  end

  # Gegeben
  def kassen_sturz()
    self.inject(0) {|akku,rechnung| akku + rechnung.rechnungs_betrag()}
  end

  # Gegeben
  def to_s()
    return "Kasse:\n #{@rechnungen.join("\n ")}\n Gesamt:#{kassen_sturz()}"
  end

end


class Rechnung
  # Gegeben
  attr_reader :positionen,:nr
  protected :positionen
  def self.reset()
    if self.class_variables().size() > 0
      var = class_variables[0]
      self.class_variable_set(var,0)
    end
  end

  # TODO

  def initialize(nr)
    #TODO
  end

  def each(&b)
    #TODO
  end

  def rechnungs_betrag()
    #TODO
  end

  def count()
    #TODO
  end

  # Gegeben
  def << pos
    @positionen << pos
    return self
  end

  def to_s()
    return "R#{@nr}:(#{rechnungs_betrag()}):#{count}/#{@positionen.size}:#{@positionen.join(",")}"
  end
end

class Position

  attr_reader :preis,:produkt,:anzahl
  def initialize(produkt,anzahl,einzelpreis)
    #TODO
  end

  def to_s()
    return "#{@produkt}(#{@anzahl}):#{preis}"
  end
end

