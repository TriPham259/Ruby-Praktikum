# Gesamt 30 Pkt plus 5 Zusatzpunkte fuer vollstaendige Loesung 

# Summe 9
class Zug

  #TODO enumerierbar machen 1
  
  def initialize(lok)
    if (!lok.is_a?(Lok))
      raise ArgumentError, "Erste Komponente #{lok} muss eine Lok sein"
    end
    @lok = lok
  end

  # Summe 3
  def ankoppeln(zugkomponente)
    #TODO
  end

  # Summe 3 letzten ZugKomponente bestimmen
  # TODO

  # Summe 2
  # TODO Iterator
  
  def to_s()
    return "Zug Laenge=#{self.count()}: [#@lok]"
  end
end