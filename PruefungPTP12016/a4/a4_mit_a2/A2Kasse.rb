# 10 Pkt
class Kasse
  # TODO Initialisierung ihrer Loesung aus a2
  include Enumerable
  def initialize
    @rechnungen = []
  end

  def each(&b)
    @rechnungen.each(&b)
  end

  def produkt_haeufigkeiten
    result = {}

    self.each { |rechnung|
      rechnung.each { |pos|
        result[pos.produkt] = 0 unless result.has_key?(pos.produkt)
        result[pos.produkt] += pos.anzahl
      }
    }

    result
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

  # TODO Initialisierung ihrer Loesung aus a2
  include Enumerable
  include Comparable

  @@count = 0

  def initialize
    @@count += 1
    @nr = @@count
    @positionen = []
  end

#  def initialize(nr)
#    @nr = nr
#    @positionen = []
#  end

  def each(&b)
    @positionen.each(&b)
  end

  def rechnungs_betrag
    self.inject(0) { |sum, pos| sum + pos.preis}
  end

  def count
    self.inject(0) { |count, pos| count + pos.anzahl}
  end

  def <=>(other)
    self.rechnungs_betrag <=> other.rechnungs_betrag
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

# 5 Pkt
class Position

  attr_reader :preis,:produkt,:anzahl
  # TODO Initialisierung ihrer Loesung aus a2
  include Comparable
  def initialize(produkt, anzahl, einzelpreis)
    @produkt = produkt
    @anzahl = anzahl
    @preis = einzelpreis * anzahl
  end

  def <=>(other)
    [self.preis, self.produkt] <=> [other.preis, other.produkt]
  end

  def to_s()
    return "#{@produkt}(#{@anzahl}):#{preis}"
  end
end

