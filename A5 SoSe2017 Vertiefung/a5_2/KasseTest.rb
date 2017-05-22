require_relative "Kasse"
require_relative "KasseHelper"
require_relative "KasseLeser"
require "test/unit"

class KasseTest < Test::Unit::TestCase
  def setup
    srand(1114)
    @kasse = KasseHelper.generiere_kasse()
    @kasse_values = to_values(@kasse)
    # p @kasse_values
    # Ausgabe ist:
    # [[1, [[1, 15, "Vitello tonnato"], [1, 15, "Antipasto misto"], [1, 16, "Riso col nero di seppie"], [1, 25, "Ossobuco"], [1, 7, "Panna cotta"], [1, 10, "Aqua"], [2, 8, "Te nero"], [1, 4, "Spuma"], [1, 3, "Coca"]]], [2, [[1, 15, "Insalata frutti di mare"], [1, 16, "Cozze al marinara"], [1, 17, "Saltimboca"], [1, 7, "Panna cotta"], [1, 8, "Tirami su"], [2, 8, "Spuma"], [2, 8, "Cappucino"], [2, 8, "Espresso"]]], [3, [[1, 15, "Antipasto misto"], [1, 15, "Vitello tonnato"], [1, 15, "Insalata frutti di mare"], [1, 17, "Saltimboca"], [2, 50, "Arrosto di manzo"], [1, 8, "Tirami su"], [1, 5, "Caffe freddo"], [1, 6, "Marsala-Zabaione"], [2, 8, "Cappucino"], [2, 20, "Aqua"], [1, 3, "Coca"]]], [4, [[2, 30, "Insalata frutti di mare"], [1, 8, "Insalata mista"], [1, 16, "Cozze al marinara"], [1, 8, "Tirami su"], [3, 9, "Coca"], [1, 4, "Espresso"], [1, 4, "Cappucino"], [1, 4, "Spuma"]]], [5, [[1, 8, "Insalata mista"], [1, 15, "Insalata frutti di mare"], [1, 15, "Antipasto misto"], [1, 17, "Saltimboca"], [1, 16, "Cozze al marinara"], [1, 25, "Arrosto di manzo"], [1, 8, "Tirami su"], [1, 6, "Marsala-Zabaione"], [1, 7, "Panna cotta"], [1, 4, "Cappucino"], [1, 4, "Spuma"], [1, 4, "Espresso"], [3, 30, "Aqua"]]], [6, [[2, 20, "Insalata Caprese"], [1, 15, "Insalata frutti di mare"], [1, 16, "Riso col nero di seppie"], [1, 5, "Caffe freddo"], [1, 6, "Marsala-Zabaione"], [3, 12, "Espresso"], [1, 4, "Te nero"], [1, 3, "Coca"]]], [7, [[1, 15, "Insalata frutti di mare"], [1, 28, "Cappon magro"], [1, 16, "Riso col nero di seppie"], [1, 8, "Tirami su"], [1, 6, "Marsala-Zabaione"], [1, 5, "Caffe freddo"], [1, 3, "Coca"], [1, 4, "Te nero"], [1, 4, "Spuma"]]], [8, [[1, 15, "Insalata frutti di mare"], [2, 30, "Vitello tonnato"], [1, 16, "Riso col nero di seppie"], [1, 12, "Pizza Margerita"], [1, 15, "Pizza Funghi&Salsiccia"], [2, 16, "Tirami su"], [3, 30, "Aqua"], [1, 4, "Espresso"], [1, 4, "Te nero"]]], [9, [[1, 15, "Insalata frutti di mare"], [1, 10, "Insalata Caprese"], [1, 25, "Ossobuco"], [1, 30, "Gamberoni alla griglia"], [1, 7, "Panna cotta"], [1, 5, "Caffe freddo"], [1, 4, "Espresso"], [1, 4, "Spuma"], [1, 4, "Te nero"]]], [10, [[1, 15, "Insalata frutti di mare"], [1, 15, "Antipasto misto"], [1, 17, "Saltimboca"], [1, 12, "Pizza Margerita"], [1, 5, "Caffe freddo"], [1, 7, "Panna cotta"], [2, 6, "Coca"], [1, 4, "Te nero"], [1, 4, "Spuma"]]]]

    @datei = "a5_2/rechnungen.sv"

    @kasse_von_datei =  KasseLeser.lese_kasse_von(@datei)
    @kasse_von_datei_values = to_values(@kasse_von_datei)

    puts @kasse_von_datei
    # Ausgabe ist:
    #    Kasse:
    #     R1:Vitello tonnato:15,Antipasto misto:15,Riso col nero di seppie:16,Ossobuco:25,Panna cotta:7,Aqua:10,Te nero:4,Spuma:4
    #     R2:Vitello tonnato:15,Orechiette pugliesi con salsiccia toscana piccante:17,Panna cotta:7,Caffe freddo:5,Spuma:4,Aqua:10
    #     R3:Insalata mista:8,Antipasto misto:15,Saltimboca:17,Cappon magro:28,Panna cotta:7,Te nero:4
    #     R4:Vitello tonnato:15,Insalata frutti di mare:15,Saltimboca:17,Tirami su:8,Cappucino:4,Espresso:4,Cappucino:4
    #     R5:Insalata Caprese:10,Arrosto di manzo:25,Tirami su:8,Aqua:10,Spuma:4
    #     R6:Antipasto misto:15,Insalata mista:8,Saltimboca:17,Pizza Margerita:12,Marsala-Zabaione:6,Marsala-Zabaione:6,Espresso:4,Coca:3,Cappucino:4
    #     R7:Insalata mista:8,Insalata mista:8,Penne arrabiata:15,Caffe freddo:5,Cappucino:4,Cappucino:4
    #     R8:Antipasto misto:15,Cozze al marinara:16,Tirami su:8,Panna cotta:7,Aqua:10
    #     R9:Vitello tonnato:15,Ossobuco:25,Marsala-Zabaione:6,Espresso:4
    #     R10:Insalata Caprese:10,Saltimboca:17,Scallopine al limone:27,Caffe freddo:5,Espresso:4,Espresso:4,Aqua:10
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
    instance_vars = eine_kasse.instance_variables().sort()
    instance_var_values_kasse = instance_vars.map(){|var| eine_kasse.instance_variable_get(var)}.flatten()
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

  # Dieser Test genügt, um die Korrektheit ihres Ergebnisses zu testen :-) 
  def test_lese_kasse
    assert_equal(@kasse_values,@kasse_von_datei_values)
  end

end