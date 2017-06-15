class Kasse
  # TODO
  include Enumerable                    #Klasse enumerierbar gemacht
  def initialize()
    #TODO
    @rechnungen = []    #speichern der Rechnungen

  end

  def each(&b)
    #TODO
    return @rechnungen.each(&b)                #Iterator für Objekte der Klasse Kasse

  end

  def produkt_haeufigkeiten()
    #TODO
    result ={}
    self.each{|rechnungen|
      rechnungen.each {|pos|
        if result.has_key?(pos.produkt)
          result[pos.produkt] += pos.anzahl
        else result[pos.produkt] = pos.anzahl
        end
      }
    }
    return result
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
  include Enumerable                     #rechnung enumierierbar machen

  def initialize(nr)
    #TODO
    @nr = nr                           #rechnungs no
    @positionen = []                 #speichern der Position
  end

  def each(&b)                           #Iterator für Objekte der Klasse Rechnung
    #TODO
    return @positionen.each(&b)
  end

  def rechnungs_betrag()
    #TODO

    #   betrag=0
    #    @positionen.each{|preis|
    #     betrag += @positionen.preis()
    #     }
    #    return betrag
    self.inject(0){|summe,pos| summe + pos.preis}    #sum = accumulator (gather or collect)
    #addiert alle gesamte betrag und ergebniss in akku stored
  end

  def count()
    #TODO
    #   total_no = 0
    #        @positionen.each{|preis|
    #         total_no += @positionen.anzahl()
    #         }
    #        return betrag

    self.inject(0){|memo,pos| memo + pos.anzahl}

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
    @produkt = produkt
    @anzahl  = anzahl
    @preis =   anzahl*einzelpreis

  end

  def to_s()
    return "#{@produkt}(#{@anzahl}):#{preis}"
  end
end


