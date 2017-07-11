# Gesamt 30 Pkt plus 5 Zusatzpunkte fuer vollstaendige Loesung

# Summe 9
class Zug

  #TODO enumerierbar machen 1
  include Enumerable
  def initialize(lok)
    if (!lok.is_a?(Lok))
      raise ArgumentError, "Erste Komponente #{lok} muss eine Lok sein"
    end
    @lok = lok
  end

  # Summe 3
  def ankoppeln(zugkomponente)
    #TODO
    return false if !zugkomponente.is_a?(ZugKomponente)
    letzte_komponente.ankoppeln(zugkomponente)
  end

  # Summe 3 letzten ZugKomponente bestimmen
  # TODO
  def letzte_komponente
  
  end

  # Summe 2
  # TODO Iterator
  def each(&block)

  end

  def to_s()
    return "Zug Laenge=#{self.count()}: [#@lok]"
  end
end

