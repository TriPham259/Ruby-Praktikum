# 10 Pkt
class Kasse
  
  #TODO 's nach Aufgabenstellung
  
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

# 15 Pkt
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

  # TODO 's nach Aufgabenstellung
 
  # Gegeben
  def << pos
    @positionen << pos
    return self
  end
  def to_s()
    return "R#{@nr}:(#{rechnungs_betrag()}):#{count}/#{@positionen.size}:#{@positionen.join(",")}"
  end
end

# 5 Pkt
class Position
  
  # Gegeben
  attr_reader :preis,:produkt,:anzahl

  #TODO 's nach Aufgabenstellung
  
  def to_s()
    return "#{@produkt}(#{@anzahl}):#{preis}"
  end
end

