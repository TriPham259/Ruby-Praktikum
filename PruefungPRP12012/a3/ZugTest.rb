require "test/unit"
require "a3/Zug"
require "a3/ZugKomponente"

class ZugTest < Test::Unit::TestCase
  def setup()
    @lok = Lok.new()
    @lok1 = Lok.new()
    @zug = Zug.new(@lok)
    @pw1 = PersonenWagen.new(2)
    @pw2 = PersonenWagen.new(2)
    @pw3 = PersonenWagen.new(1)
  end

  def test_each_etc()
    assert(@zug.count() == 1)
    assert_equal([@lok], @zug.map(){|k| k})
  end

  def test_ankoppeln_pos_1()
    assert(@zug.ankoppeln(@pw3))
    assert(@zug.ankoppeln(@pw1))
    assert(@zug.ankoppeln(@pw2))
    assert_equal([@lok,@pw3,@pw1,@pw2],@zug.map(){|k| k})
  end

  def test_ankoppeln_pos_2()
    # einzelne Wagen
    assert(@zug.ankoppeln(@pw2))
    assert(@zug.ankoppeln(@pw1))
    assert_equal([@lok,@pw2,@pw1],@zug.map(){|k| k})
  end

  def test_ankoppeln_pos_3()
    # einzelne Wagen
    assert(@zug.ankoppeln(@pw3))
    assert(@pw1.ankoppeln(@pw2))
    #Kette von Wagen
    assert(@zug.ankoppeln(@pw1))
    assert_equal([@lok,@pw3,@pw1,@pw2],@zug.map(){|k| k})
  end

  def test_ankoppeln_neg_1()
    # Ankoppeln eines identischen Wagen an einen Wagen nicht moeglich
    assert(!@pw3.ankoppeln(@pw3))
  end

  def test_ankoppeln_neg_2()
    # keine erste Klasse nach der zweiten Klasse
    assert(@zug.ankoppeln(@pw1))
    assert(!@zug.ankoppeln(@pw3))
    assert_equal([@lok,@pw1],@zug.map(){|k| k})
  end

  def test_ankoppeln_neg_3()
    # keine Lok nach PersonenWagen, keine Lok nach Lok
    assert(@zug.ankoppeln(@pw1))
    assert(!@zug.ankoppeln(@lok))
    assert_equal([@lok,@pw1],@zug.map(){|k| k})
    assert(!@zug.ankoppeln(@lok1))
    assert_equal([@lok,@pw1],@zug.map(){|k| k})
  end

  def test_ankoppeln_neg_4()
    # Ankoppeln an einen Wagen, nur wenn der Wagen keinen Nachfolger hat
    assert(@pw3.ankoppeln(@pw2))
    assert(!@pw3.ankoppeln(@pw1))
    assert_equal([@pw3,@pw2],@pw3.map(){|w| w})
  end

  def test_ankoppeln_neg_5()
    # nur Ankoppeln von Zugkomponenten
    assert(!@zug.ankoppeln(nil))
    assert(!@zug.ankoppeln([1,2,3]))
    assert_equal([@lok],@zug.map(){|w| w})
  end

  def test_nummerieren()
    assert(@zug.ankoppeln(@pw3))
    assert(@pw1.ankoppeln(@pw2))
    assert(@pw1.nr==0)
    assert(@pw2.nr==1)
    assert(@zug.ankoppeln(@pw1))
    assert(@pw1.nr==2)
    assert(@pw2.nr==3)
  end

end