require "test/unit"
require "a4/Baum"

class BaumTest < Test::Unit::TestCase
  def setup()
  end

  def test_equal()
    b_copy1 = lade_baum_kopie("vorlage")
    b_copy2 = lade_baum_kopie("vorlage")
    b_copy3 = lade_baum_kopie("vorlage")
    
    # reflexiv
    assert_equal(b_copy1,b_copy1)
    # symmetrisch
    assert((b_copy1==b_copy2) && (b_copy2==b_copy1))
    assert(!(b_copy1==b_copy2 && b_copy2==b_copy3) || b_copy1 == b_copy3)
    puts "vorlage"
    puts b_copy1
    
    b_copy_integer = lade_baum_kopie("vorlage_integer")
    # Zweite Vorlage
    puts "vorlage integer"
    puts b_copy_integer

    # keine gleichen Strukturen
    assert(!(b_copy_integer==b_copy1))
  end

  def test_einfuegen
    b = Baum.new(1,Numeric)
    b.einfuegen(1,2)
    b.einfuegen(2,5)
    b.einfuegen(1,3)
    b.einfuegen(3,2)
    b.einfuegen(3,4)
    b.einfuegen(4,9)
    b.einfuegen(2,7)

    b_copy = lade_baum_kopie("vorlage")
    assert_equal(b_copy,b)
    # keine Einfuegen bei nicht existenten Knoten
    assert_equal(b_copy,b.einfuegen(10,8))
    # keine Einfuegen von inkompatibeln Werten
    assert_raises(ArgumentError){ b.einfuegen(3,"nicht kompatibel")}
  end

  def lade_baum_kopie(datei_name)
    b_copy = nil
    File.open("a4/#{datei_name}"){|vorlage|
      b_copy = Marshal.load(vorlage)
    }
    return b_copy
  end

  def test_each()
    b_copy = lade_baum_kopie("vorlage")
    sammle_inhalte =[]
    b_copy.each(){|x| sammle_inhalte << x}
    assert_equal([1,2,5,7,3,2,7,4,9],sammle_inhalte)
  end

  def test_zaehle_inhalte()
    b_copy = lade_baum_kopie("vorlage")
    assert_equal(2,b_copy.zaehle(2))
    assert_equal(1,b_copy.zaehle(9))
    assert_equal(0,b_copy.zaehle(-77777))
  end

  def test_sortiere()
    b_copy = lade_baum_kopie("vorlage")
    assert_equal([1,2,2,3,4,5,7,7,9], b_copy.sortiere())
    assert_equal([10], Baum.new(10,Integer).sortiere())
  end

  def test_alle_inhalte_fuer_bdg()
    b_copy = lade_baum_kopie("vorlage")
    assert_equal([3,4,5,7,7,9], b_copy.alle_inhalte_fuer_bdg{|x| x > 2}.sort())
    assert_equal([2,2,4], b_copy.alle_inhalte_fuer_bdg{|x| x % 2 == 0}.sort())
    assert_equal([], b_copy.alle_inhalte_fuer_bdg{|x| x % 6 == 0}.sort())
  end

  def test_each_node()
    b_copy = lade_baum_kopie("vorlage")

    node_sammlung = []
    # schmutziger Trick !!
    start_knoten = b_copy.instance_variable_get("@start_knoten")
    # Tested, ob nur Knoten besucht werden
    start_knoten.each_node(){|node| node_sammlung << node }
    assert(node_sammlung.all?(){|n| n.is_a?(Knoten)})

    # gleiche Inhalte testen wir mit to_a() und indem die Knoten
    # auf ihre Inhalte projiziert werden
    assert_equal(b_copy.to_a(), node_sammlung.map(){|n| n.inhalt})

    node_sammlung = []
    # Testet, ob über Knoten iteriert wird, indem auf Inhalt und
    # kind_knoten zugegriffen wird
    start_knoten.each_node(){|node|
      node_sammlung << [node.inhalt,
        node.instance_variable_get("@kind_knoten").
        map(){|n| n.inhalt()}]
    }
    # Ergebnis ist ein Array von 2-elementigen Arrays, deren erstes
    # Element der Inhalt des Elternknotens ist und deren zweites Element
    # die Inhalte der direkten Kindknoten sind.
    assert_equal([[1, [2, 3]], [2, [5, 7]], [5, []], [7, []], [3, [2, 4]], [2, [7]], [7, []], [4, [9]], [9, []]],    node_sammlung)
  end

end