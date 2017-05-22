require "test/unit"

require_relative "Kasse"
require_relative "KasseHelper"

class A2KasseTest < Test::Unit::TestCase
  def setup()
    srand(1114)
    Rechnung.reset()
    @rechnungen = KasseHelper.generiere_rechnungen()
    @positionen = KasseHelper.generiere_positionen()
    @kasse = KasseHelper.generiere_kasse()

    #    @positionen.each_with_index(){|e,i| puts "#{i}:#{e}"}
    #    Ausgabe ist dann
    #    0:Insalata frutti di mare(1):15
    #    1:Antipasto misto(1):15
    #    2:Riso col nero di seppie(1):16
    #    3:Tirami su(1):8
    #    4:Panna cotta(1):7
    #    5:Te nero(2):8
    #    6:Coca(2):6
    #    7:Cappucino(1):4

    # Erzeugen der sortierten Positionen

    pos_sortiert_only_index = [7,6,4,5,3,1,0,2]
    @positionen_sortiert = []
    pos_sortiert_only_index.each(){|index| @positionen_sortiert << @positionen[index] }

    #    puts "!!!!!!!!!!!!!!!!!!!!!!!!!"
    #   @positionen_sortiert.each_with_index(){|e,i| puts "#{i}:#{e}"}
    #    Ausgabe ist dann
    #0:Cappucino(1):4
    #1:Coca(2):6
    #2:Panna cotta(1):7
    #3:Te nero(2):8
    #4:Tirami su(1):8
    #5:Antipasto misto(1):15
    #6:Insalata frutti di mare(1):15
    #7:Riso col nero di seppie(1):16

    #    puts "::::::::::::::::::::::::::::::"
    # @rechnungen.each_with_index(){|e,i| puts "#{i}:#{e}"}
    # Ausgabe ist
    #0:R1:(103):10/9:Vitello tonnato(1):15,Antipasto misto(1):15,Riso col nero di seppie(1):16,Ossobuco(1):25,Panna cotta(1):7,Aqua(1):10,Te nero(2):8,Spuma(1):4,Coca(1):3
    #1:R2:(87):11/8:Insalata frutti di mare(1):15,Cozze al marinara(1):16,Saltimboca(1):17,Panna cotta(1):7,Tirami su(1):8,Spuma(2):8,Cappucino(2):8,Espresso(2):8
    #2:R3:(162):14/11:Antipasto misto(1):15,Vitello tonnato(1):15,Insalata frutti di mare(1):15,Saltimboca(1):17,Arrosto di manzo(2):50,Tirami su(1):8,Caffe freddo(1):5,Marsala-Zabaione(1):6,Cappucino(2):8,Aqua(2):20,Coca(1):3
    #3:R4:(83):11/8:Insalata frutti di mare(2):30,Insalata mista(1):8,Cozze al marinara(1):16,Tirami su(1):8,Coca(3):9,Espresso(1):4,Cappucino(1):4,Spuma(1):4
    #4:R5:(159):15/13:Insalata mista(1):8,Insalata frutti di mare(1):15,Antipasto misto(1):15,Saltimboca(1):17,Cozze al marinara(1):16,Arrosto di manzo(1):25,Tirami su(1):8,Marsala-Zabaione(1):6,Panna cotta(1):7,Cappucino(1):4,Spuma(1):4,Espresso(1):4,Aqua(3):30
    #5:R6:(81):11/8:Insalata Caprese(2):20,Insalata frutti di mare(1):15,Riso col nero di seppie(1):16,Caffe freddo(1):5,Marsala-Zabaione(1):6,Espresso(3):12,Te nero(1):4,Coca(1):3
    #6:R7:(89):9/9:Insalata frutti di mare(1):15,Cappon magro(1):28,Riso col nero di seppie(1):16,Tirami su(1):8,Marsala-Zabaione(1):6,Caffe freddo(1):5,Coca(1):3,Te nero(1):4,Spuma(1):4
    #7:R8:(142):13/9:Insalata frutti di mare(1):15,Vitello tonnato(2):30,Riso col nero di seppie(1):16,Pizza Margerita(1):12,Pizza Funghi&Salsiccia(1):15,Tirami su(2):16,Aqua(3):30,Espresso(1):4,Te nero(1):4
    #8:R9:(104):9/9:Insalata frutti di mare(1):15,Insalata Caprese(1):10,Ossobuco(1):25,Gamberoni alla griglia(1):30,Panna cotta(1):7,Caffe freddo(1):5,Espresso(1):4,Spuma(1):4,Te nero(1):4
    #9:R10:(85):10/9:Insalata frutti di mare(1):15,Antipasto misto(1):15,Saltimboca(1):17,Pizza Margerita(1):12,Caffe freddo(1):5,Panna cotta(1):7,Coca(2):6,Te nero(1):4,Spuma(1):4

    #    puts "!!!!!!!!!!!!!!!!!!!!!!!!!"
    #    puts @rechnungen.max()
    # Ausgabe ist
    # R3:(162):14/11:Antipasto misto(1):15,Vitello tonnato(1):15,Insalata frutti di mare(1):15,Saltimboca(1):17,Arrosto di manzo(2):50,Tirami su(1):8,Caffe freddo(1):5,Marsala-Zabaione(1):6,Cappucino(2):8,Aqua(2):20,Coca(1):3

    #puts "::::::::::::::::::::::::::::::"
    #puts @kasse.max()
    # Ausgabe ist
    # R12:(148):13/12:Insalata frutti di mare(1):15,Insalata Caprese(1):10,Vitello tonnato(1):15,Cappon magro(1):28,Arrosto di manzo(1):25,Riso col nero di seppie(1):16,Tirami su(1):8,Caffe freddo(1):5,Te nero(2):8,Espresso(1):4,Cappucino(1):4,Aqua(1):10

    #puts "!!!!!!!!!!!!!!!!!!!!!"
    puts @kasse
    # Ausgabe ist
    #Kasse:
    # R11:(113):14/10:Insalata Caprese(1):10,Insalata mista(1):8,Antipasto misto(1):15,Pizza Margerita(1):12,Orechiette pugliesi con salsiccia toscana piccante(1):17,Caffe freddo(3):15,Aqua(2):20,Cappucino(2):8,Espresso(1):4,Spuma(1):4
    # R12:(148):13/12:Insalata frutti di mare(1):15,Insalata Caprese(1):10,Vitello tonnato(1):15,Cappon magro(1):28,Arrosto di manzo(1):25,Riso col nero di seppie(1):16,Tirami su(1):8,Caffe freddo(1):5,Te nero(2):8,Espresso(1):4,Cappucino(1):4,Aqua(1):10
    # R13:(88):10/6:Insalata frutti di mare(2):30,Riso col nero di seppie(1):16,Caffe freddo(2):10,Aqua(2):20,Cappucino(2):8,Spuma(1):4
    # R14:(99):10/7:Vitello tonnato(2):30,Pizza Margerita(1):12,Orechiette pugliesi con salsiccia toscana piccante(1):17,Marsala-Zabaione(2):12,Aqua(2):20,Spuma(1):4,Te nero(1):4
    # R15:(104):11/8:Insalata frutti di mare(2):30,Cozze al marinara(1):16,Pizza Margerita(1):12,Orechiette pugliesi con salsiccia toscana piccante(1):17,Panna cotta(2):14,Cappucino(1):4,Spuma(2):8,Coca(1):3
    # R16:(63):7/7:Insalata mista(1):8,Antipasto misto(1):15,Penne arrabiata(1):15,Panna cotta(1):7,Spuma(1):4,Aqua(1):10,Cappucino(1):4
    # R17:(103):11/11:Insalata frutti di mare(1):15,Antipasto misto(1):15,Arrosto di manzo(1):25,Pizza Funghi&Salsiccia(1):15,Marsala-Zabaione(1):6,Tirami su(1):8,Cappucino(1):4,Spuma(1):4,Coca(1):3,Te nero(1):4,Espresso(1):4
    # R18:(126):10/7:Antipasto misto(1):15,Cozze al marinara(1):16,Cappon magro(1):28,Arrosto di manzo(1):25,Panna cotta(2):14,Espresso(2):8,Aqua(2):20
    # R19:(102):11/9:Insalata frutti di mare(1):15,Antipasto misto(1):15,Pizza Margerita(1):12,Riso col nero di seppie(2):32,Marsala-Zabaione(2):12,Espresso(1):4,Spuma(1):4,Cappucino(1):4,Te nero(1):4
    # R20:(91):11/8:Vitello tonnato(1):15,Ossobuco(1):25,Pizza Margerita(2):24,Caffe freddo(1):5,Coca(2):6,Spuma(1):4,Te nero(1):4,Cappucino(2):8
    # Gesamt:1037

    kasse_sortiert_only_index = [5, 2, 9, 3, 8, 6, 4, 0, 7, 1]
    @kasse_sortiert= kasse_sortiert_only_index.map(){|index| @kasse.to_a()[index] }
    #puts "!!!!!!!!!!!!!!!!!!!!!"
    #puts @kasse.sort()
    # Ausgabe ist
    #R16:(63):7/7:Insalata mista(1):8,Antipasto misto(1):15,Penne arrabiata(1):15,Panna cotta(1):7,Spuma(1):4,Aqua(1):10,Cappucino(1):4
    #R13:(88):10/6:Insalata frutti di mare(2):30,Riso col nero di seppie(1):16,Caffe freddo(2):10,Aqua(2):20,Cappucino(2):8,Spuma(1):4
    #R20:(91):11/8:Vitello tonnato(1):15,Ossobuco(1):25,Pizza Margerita(2):24,Caffe freddo(1):5,Coca(2):6,Spuma(1):4,Te nero(1):4,Cappucino(2):8
    #R14:(99):10/7:Vitello tonnato(2):30,Pizza Margerita(1):12,Orechiette pugliesi con salsiccia toscana piccante(1):17,Marsala-Zabaione(2):12,Aqua(2):20,Spuma(1):4,Te nero(1):4
    #R19:(102):11/9:Insalata frutti di mare(1):15,Antipasto misto(1):15,Pizza Margerita(1):12,Riso col nero di seppie(2):32,Marsala-Zabaione(2):12,Espresso(1):4,Spuma(1):4,Cappucino(1):4,Te nero(1):4
    #R17:(103):11/11:Insalata frutti di mare(1):15,Antipasto misto(1):15,Arrosto di manzo(1):25,Pizza Funghi&Salsiccia(1):15,Marsala-Zabaione(1):6,Tirami su(1):8,Cappucino(1):4,Spuma(1):4,Coca(1):3,Te nero(1):4,Espresso(1):4
    #R15:(104):11/8:Insalata frutti di mare(2):30,Cozze al marinara(1):16,Pizza Margerita(1):12,Orechiette pugliesi con salsiccia toscana piccante(1):17,Panna cotta(2):14,Cappucino(1):4,Spuma(2):8,Coca(1):3
    #R11:(113):14/10:Insalata Caprese(1):10,Insalata mista(1):8,Antipasto misto(1):15,Pizza Margerita(1):12,Orechiette pugliesi con salsiccia toscana piccante(1):17,Caffe freddo(3):15,Aqua(2):20,Cappucino(2):8,Espresso(1):4,Spuma(1):4
    #R18:(126):10/7:Antipasto misto(1):15,Cozze al marinara(1):16,Cappon magro(1):28,Arrosto di manzo(1):25,Panna cotta(2):14,Espresso(2):8,Aqua(2):20
    #R12:(148):13/12:Insalata frutti di mare(1):15,Insalata Caprese(1):10,Vitello tonnato(1):15,Cappon magro(1):28,Arrosto di manzo(1):25,Riso col nero di seppie(1):16,Tirami su(1):8,Caffe freddo(1):5,Te nero(2):8,Espresso(1):4,Cappucino(1):4,Aqua(1):10

    # Kleine Kasse erzeugen

    @kleine_kasse = Kasse.new()
    @kasse.select(){|rechnung| rechnung.to_a().count()/ rechnung.count().to_f() <= 0.7 }.each(){|rechnung| @kleine_kasse << rechnung}
    #   puts @kleine_kasse
    # Ausgabe ist
    #Kasse:
    # R13:(88):10/6:Insalata frutti di mare(2):30,Riso col nero di seppie(1):16,Caffe freddo(2):10,Aqua(2):20,Cappucino(2):8,Spuma(1):4
    # R14:(99):10/7:Vitello tonnato(2):30,Pizza Margerita(1):12,Orechiette pugliesi con salsiccia toscana piccante(1):17,Marsala-Zabaione(2):12,Aqua(2):20,Spuma(1):4,Te nero(1):4
    # R18:(126):10/7:Antipasto misto(1):15,Cozze al marinara(1):16,Cappon magro(1):28,Arrosto di manzo(1):25,Panna cotta(2):14,Espresso(2):8,Aqua(2):20
    # Gesamt:313
    @produkt_haeufigkeiten = {"Insalata frutti di mare"=>2, "Riso col nero di seppie"=>1, "Caffe freddo"=>2, "Aqua"=>6, "Cappucino"=>2, "Spuma"=>2, "Vitello tonnato"=>2, "Pizza Margerita"=>1, "Orechiette pugliesi con salsiccia toscana piccante"=>1, "Marsala-Zabaione"=>2, "Te nero"=>1, "Antipasto misto"=>1, "Cozze al marinara"=>1, "Cappon magro"=>1, "Arrosto di manzo"=>1, "Panna cotta"=>2, "Espresso"=>2}

  end

  def test_position_preis()
    assert_equal(8,@positionen[5].preis(),"Preisberechnung falsch")
    assert_equal(6,@positionen[6].preis(),"Preisberechnung falsch")
  end

  def test_rechnung_nr()
    #puts @rechnungen
    assert(@rechnungen.all?(){|rechnung| rechnung.nr == @rechnungen.index(rechnung)+1})
  end

  def test_rechnung_push()
    assert_same(@rechnungen[0], @rechnungen[0]<<Position.new("Panna cotta",1,12))
    assert_same(@rechnungen[4], @rechnungen[4]<<Position.new("Panna cotta",1,12))
    assert_same(@rechnungen[9], @rechnungen[9]<<Position.new("Panna cotta",1,12))
  end

  def test_rechnung_rechnungs_betrag()
    assert_equal(103,@rechnungen[0].rechnungs_betrag, "Falsche Rechnungssumme")
    assert_equal(159,@rechnungen[4].rechnungs_betrag, "Falsche Rechnungssumme")
    assert_equal(85,@rechnungen[9].rechnungs_betrag, "Falsche Rechnungssumme")
  end

  def test_rechnung_count()
    assert_equal(10,@rechnungen[0].count)
    assert_equal(15,@rechnungen[4].count)
    assert_equal(10,@rechnungen[9].count)
  end

  def test_rechnung_sonstiges()
    assert_equal([103,87,162,83,159,81,89,142,104,85],@rechnungen.map(){|r| r.rechnungs_betrag()})
  end

  def test_kasse_push
    count = @kasse.count()
    rechnung = Rechnung.new(1000)
    assert_same(@kasse,@kasse<<rechnung)
    assert_equal(count+1,@kasse.count())
    assert_equal(rechnung,@kasse.to_a().last())
  end

  def test_kasse_kassen_sturz()
    assert_equal(1037,@kasse.kassen_sturz())
  end

  def test_kasse_sonstiges()
    assert_equal( [113, 148, 88, 99, 104, 63, 103, 126, 102, 91],@kasse.map(){|rechnung| rechnung.rechnungs_betrag()})
  end

  def test_kasse_produkt_haeufigkeiten
    assert_equal(@produkt_haeufigkeiten,@kleine_kasse.produkt_haeufigkeiten())
  end
end