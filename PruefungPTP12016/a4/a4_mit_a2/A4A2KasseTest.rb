require_relative "A2Kasse"
require_relative "A2KasseHelper"
require_relative "A4A2KasseLeser"
require "test/unit"

class A4KasseTest < Test::Unit::TestCase
  def setup
    srand(1114)
    @kasse = KasseHelper.generiere_kasse()
    @kasse_values = to_values(@kasse)
    # p @kasse_values
    # Ausgabe ist:
    # [[1, [[1, 15, "Vitello tonnato"], [1, 15, "Antipasto misto"], [1, 16, "Riso col nero di seppie"], [1, 25, "Ossobuco"], [1, 7, "Panna cotta"], [1, 10, "Aqua"], [2, 8, "Te nero"], [1, 4, "Spuma"], [1, 3, "Coca"]]], [2, [[1, 15, "Insalata frutti di mare"], [1, 16, "Cozze al marinara"], [1, 17, "Saltimboca"], [1, 7, "Panna cotta"], [1, 8, "Tirami su"], [2, 8, "Spuma"], [2, 8, "Cappucino"], [2, 8, "Espresso"]]], [3, [[1, 15, "Antipasto misto"], [1, 15, "Vitello tonnato"], [1, 15, "Insalata frutti di mare"], [1, 17, "Saltimboca"], [2, 50, "Arrosto di manzo"], [1, 8, "Tirami su"], [1, 5, "Caffe freddo"], [1, 6, "Marsala-Zabaione"], [2, 8, "Cappucino"], [2, 20, "Aqua"], [1, 3, "Coca"]]], [4, [[2, 30, "Insalata frutti di mare"], [1, 8, "Insalata mista"], [1, 16, "Cozze al marinara"], [1, 8, "Tirami su"], [3, 9, "Coca"], [1, 4, "Espresso"], [1, 4, "Cappucino"], [1, 4, "Spuma"]]], [5, [[1, 8, "Insalata mista"], [1, 15, "Insalata frutti di mare"], [1, 15, "Antipasto misto"], [1, 17, "Saltimboca"], [1, 16, "Cozze al marinara"], [1, 25, "Arrosto di manzo"], [1, 8, "Tirami su"], [1, 6, "Marsala-Zabaione"], [1, 7, "Panna cotta"], [1, 4, "Cappucino"], [1, 4, "Spuma"], [1, 4, "Espresso"], [3, 30, "Aqua"]]], [6, [[2, 20, "Insalata Caprese"], [1, 15, "Insalata frutti di mare"], [1, 16, "Riso col nero di seppie"], [1, 5, "Caffe freddo"], [1, 6, "Marsala-Zabaione"], [3, 12, "Espresso"], [1, 4, "Te nero"], [1, 3, "Coca"]]], [7, [[1, 15, "Insalata frutti di mare"], [1, 28, "Cappon magro"], [1, 16, "Riso col nero di seppie"], [1, 8, "Tirami su"], [1, 6, "Marsala-Zabaione"], [1, 5, "Caffe freddo"], [1, 3, "Coca"], [1, 4, "Te nero"], [1, 4, "Spuma"]]], [8, [[1, 15, "Insalata frutti di mare"], [2, 30, "Vitello tonnato"], [1, 16, "Riso col nero di seppie"], [1, 12, "Pizza Margerita"], [1, 15, "Pizza Funghi&Salsiccia"], [2, 16, "Tirami su"], [3, 30, "Aqua"], [1, 4, "Espresso"], [1, 4, "Te nero"]]], [9, [[1, 15, "Insalata frutti di mare"], [1, 10, "Insalata Caprese"], [1, 25, "Ossobuco"], [1, 30, "Gamberoni alla griglia"], [1, 7, "Panna cotta"], [1, 5, "Caffe freddo"], [1, 4, "Espresso"], [1, 4, "Spuma"], [1, 4, "Te nero"]]], [10, [[1, 15, "Insalata frutti di mare"], [1, 15, "Antipasto misto"], [1, 17, "Saltimboca"], [1, 12, "Pizza Margerita"], [1, 5, "Caffe freddo"], [1, 7, "Panna cotta"], [2, 6, "Coca"], [1, 4, "Te nero"], [1, 4, "Spuma"]]]]

    @datei = "a4/rechnungen.sv"

    Rechnung.reset()

    @kasse_von_datei =  KasseLeser.lese_kasse_von(@datei)
    @kasse_von_datei_values = to_values(@kasse_von_datei)

    puts @kasse_values==@kasse_von_datei_values
    # puts @kasse_von_datei
    # Ausgabe ist:
    #    R1:(96):8/8:Vitello tonnato(1):15,Antipasto misto(1):15,Riso col nero di seppie(1):16,Ossobuco(1):25,Panna cotta(1):7,Aqua(1):10,Te nero(1):4,Spuma(1):4
    #    R2:(58):6/6:Vitello tonnato(1):15,Orechiette pugliesi con salsiccia toscana piccante(1):17,Panna cotta(1):7,Caffe freddo(1):5,Spuma(1):4,Aqua(1):10
    #    R3:(79):6/6:Insalata mista(1):8,Antipasto misto(1):15,Saltimboca(1):17,Cappon magro(1):28,Panna cotta(1):7,Te nero(1):4
    #    R4:(67):7/7:Vitello tonnato(1):15,Insalata frutti di mare(1):15,Saltimboca(1):17,Tirami su(1):8,Cappucino(1):4,Espresso(1):4,Cappucino(1):4
    #    R5:(57):5/5:Insalata Caprese(1):10,Arrosto di manzo(1):25,Tirami su(1):8,Aqua(1):10,Spuma(1):4
    #    R6:(75):9/9:Antipasto misto(1):15,Insalata mista(1):8,Saltimboca(1):17,Pizza Margerita(1):12,Marsala-Zabaione(1):6,Marsala-Zabaione(1):6,Espresso(1):4,Coca(1):3,Cappucino(1):4
    #    R7:(44):6/6:Insalata mista(1):8,Insalata mista(1):8,Penne arrabiata(1):15,Caffe freddo(1):5,Cappucino(1):4,Cappucino(1):4
    #    R8:(56):5/5:Antipasto misto(1):15,Cozze al marinara(1):16,Tirami su(1):8,Panna cotta(1):7,Aqua(1):10
    #    R9:(50):4/4:Vitello tonnato(1):15,Ossobuco(1):25,Marsala-Zabaione(1):6,Espresso(1):4
    #    R10:(77):7/7:Insalata Caprese(1):10,Saltimboca(1):17,Scallopine al limone(1):27,Caffe freddo(1):5,Espresso(1):4,Espresso(1):4,Aqua(1):10
    #    Gesamt:659
  end

  # Wandelt ein Kassenobjekt in ein Array von Werten der Standard-Rubytypen um. Zur Ergebnisstruktur 
  # siehe setup (@kasse_values / @kasse_von_datei_values).
  #
  # Ermoeglicht den inhaltlichen Vergleich zwischen dem aus Datei rekonstruierten Kassen-Objekt 
  # (@kasse_von_datei) und dem generierten Kassen-Objekt (@kasse). Invariant gegen die Reihenfolge 
  # der Definition von Instanzvariablen 
  # in den Klassen
  # 
  # Muessen Sie nicht verstehen :-)

  def to_values(eine_kasse)
    instance_vars = @kasse.instance_variables().sort()
    instance_var_values_kasse = instance_vars.map(){|var| @kasse.instance_variable_get(var)}.flatten()
    return (instance_var_values_kasse.inject([]){|akku,val|
      inst_vals_rechnung = val.instance_variables().sort().map(){|var| val.instance_variable_get(var)}
      akku + [
        inst_vals_rechnung.inject([]){|akku2,inst_val|
        akku2 <<  (inst_val.is_a?(Array) ?  inst_val.map(){|pos|
        pos.instance_variables().sort().map(){|pos_var| pos.instance_variable_get(pos_var)}}:
        inst_val)
        akku2
        }
      ]
    })
  end
  private :to_values

  def test_lese_kasse
    assert_equal(@kasse_values,@kasse_von_datei_values)
  end

end