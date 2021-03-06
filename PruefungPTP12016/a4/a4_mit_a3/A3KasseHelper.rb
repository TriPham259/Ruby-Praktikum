require_relative "A3Kasse"

class KasseHelper
  
  VORSPEISEN = ["Insalata frutti di mare", "Insalata mista","Insalata Caprese", "Vitello tonnato",
    "Antipasto misto"]
  PREISE_VORSPEISEN  = [15,8,10,15,15]
  HAUPTGERICHTE = ["Pizza Margerita", "Pizza Funghi&Salsiccia", "Riso col nero di seppie",
    "Saltimboca", "Arrosto di manzo", "Scallopine al limone", "Ossobuco", "Penne arrabiata",
    "Orechiette pugliesi con salsiccia toscana piccante", "Cozze al marinara", "Gamberoni alla griglia",
    "Cappon magro"]
  PREISE_HAUPTGERICHTE  = [12,15,16,17,25,27,25,15,17,16,30,28]
  NACHSPEISEN = ["Tirami su", "Panna cotta", "Marsala-Zabaione", "Caffe freddo"]
  PREISE_NACHSPEISEN  = [8,7,6,5]
  GETRAENKE = ["Aqua", "Spuma", "Coca", "Espresso", "Cappucino", "Te nero"]
  PREISE_GETRAENKE  = [10,4,3,4,4,4]

  def self.generiere_rechnungen()
    rechnungen = []
    10.times do |i|

      rechnungen << generiere_positionen().inject(Rechnung.new(i+1)){|akku,pos|
        akku.<<(pos)
        akku
      }
    end
    return rechnungen
  end

  def self.generiere_positionen()
    positionen = []
    rand(1..2).times do
      vor = VORSPEISEN.sample()
      positionen << vor
      positionen << PREISE_VORSPEISEN[VORSPEISEN.index(vor)]
    end
    rand(1..2).times do
      vor = HAUPTGERICHTE.sample()
      positionen << vor
      positionen << PREISE_HAUPTGERICHTE[HAUPTGERICHTE.index(vor)]
    end
    rand(1..2).times do
      vor = NACHSPEISEN.sample()
      positionen << vor
      positionen << PREISE_NACHSPEISEN[NACHSPEISEN.index(vor)]
    end
    rand(1..3).times do
      vor = GETRAENKE.sample()
      positionen << vor
      positionen << PREISE_GETRAENKE[GETRAENKE.index(vor)]
    end
    positionen_objekte = []
    (0...positionen.size()).step(2){|index|
      positionen_objekte << Position.new(positionen[index],positionen[index+1]) }
    return positionen_objekte
  end

  def self.generiere_kasse()
    generiere_rechnungen().inject(Kasse.new()){|k,r|
      k.<<(r)
      k}
  end
end
