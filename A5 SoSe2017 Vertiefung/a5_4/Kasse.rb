class Kasse
  include Enumerable

  def initialize
    @rechnungen = []
  end

  def each(&b)
    @rechnungen.each(&b)
  end

  def produkt_haeufigkeiten
    ergebnis = {}
    self.each {|rechnung|
      rechnung.each { |pos|
        ergebnis[pos.produkt] = pos.anzahl
      }
    }

    ergebnis
  end

  # Gegeben
  def <<(rechnung)
    @rechnungen << rechnung
    self
  end

  # Gegeben
  def kassen_sturz
    self.inject(0) {|akku,rechnung| akku + rechnung.rechnungs_betrag}
  end

  # Gegeben
  def to_s
    "Kasse:\n #{@rechnungen.join("\n ")}\n Gesamt:#{kassen_sturz}"
  end

end


class Rechnung
  include Enumerable

  # Gegeben
  attr_reader :positionen,:nr
  protected :positionen
  def self.reset
    if self.class_variables.size > 0
      var = class_variables[0]
      self.class_variable_set(var,0)
    end
  end


  def initialize(nr)
    @nr = nr
    @positionen = []
  end

  def each(&b)
    @positionen.each(&b)
  end

  def rechnungs_betrag
    self.inject(0) { |akku, pos| akku + pos.preis}
  end

  def count
    self.inject(0) { |akku, pos| akku + pos.anzahl}
  end

  # Gegeben
  def << pos
    @positionen << pos
    self
  end

  def to_s
    "R#{@nr}:(#{rechnungs_betrag}):#{count}/#{@positionen.size}:#{@positionen.join(",")}"
  end
end

class Position

  attr_reader :preis,:produkt,:anzahl

  def initialize(produkt,anzahl,einzelpreis)
    @produkt = produkt
    @anzahl = anzahl
    @preis = einzelpreis * anzahl

  end

  def to_s
    "#{@produkt}(#{@anzahl}):#{preis}"
  end
end

pos1 = Position.new('Cola',2,3)
pos2 = Position.new('Pepsi',3,5)
pos3 = Position.new('Sprite',2,4)
pos4 = Position.new('Fanta',3,6)

rechnung1 = Rechnung.new
rechnung1 << pos1 << pos3
puts rechnung1

rechnung2 = Rechnung.new
rechnung2 = pos1 << pos3 << pos4
puts rechnung2

my_kasse = Kasse.new
my_kasse << rechnung1 << rechnung2
puts my_kasse
