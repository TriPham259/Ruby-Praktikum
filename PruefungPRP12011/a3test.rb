require "test/unit"
require "a3"

class A3Test < Test::Unit::TestCase
  def setup()
    @ma1 =  Manager.new("m1","m1-0", 8000)
    @ma21 = Manager.new("m21","m21-0", 5000)
    @ma3 =  Manager.new("m3","m3-0", 7000)
    @ma4 =  Manager.new("m4","m5-0", 6000)
    @ma23 = Manager.new("m23","m23-0", 5000)
    @ma24 = Manager.new("m24","m24-0", 5000)
    
    ((@ma1 << @ma21) << @ma3)
    @ma3 << @ma4 << @ma23
    @ma4 << @ma24
   
    @a41 = Angestellte.new("a41", "a41-0", 2000)
    @a42 = Angestellte.new("a42", "a42-0", 2000)
    @a31 = Angestellte.new("a31", "a31-0", 2000)
    @a32= Angestellte.new("a32", "a32-0", 2000)
    @a21 = Angestellte.new("a21", "a21-0", 2000)
    @a23 = Angestellte.new("a23", "a23-0", 2000)
    @a24 = Angestellte.new("a24", "a24-0", 2000)
    @a11 = Angestellte.new("a11", "a11-0", 2000)
    
    @ma24 << @a24
    @ma23 << @a23
    @ma21 << @a21
    @ma1 << @a11
    @ma3 << @a31
    @ma3 <<@a32
    @ma4 << @a41
    @ma4 << @a42
    puts @ma1
  end
  
  def test_modell_eigenschaften()
    assert_raise(NoMethodError){Mitarbeiter.new("a1","0",2000)}
    assert_nothing_raised(){Angestellte.new("a1","0",2000)}
    assert_nothing_raised(){Manager.new("m1","0",7000)}
  end
  
  def test_bonus()
    assert_equal(2000,@a24.bonus())
    assert_equal(3000.0,@ma23.bonus())
    assert_equal(3000.0, @ma21.bonus())
    assert_equal(3937.5,@ma3.bonus())
    assert_equal(3500.0, @ma4.bonus())
    assert_equal(4468.75,@ma1.bonus())
  end
  
  def test_berichts_ebene()
    assert(4== @ma1.berichts_ebene())
    assert(3==  @ma3.berichts_ebene())
    assert(2==  @ma4.berichts_ebene())
    assert(1==  @ma21.berichts_ebene())
    assert(1==  @ma23.berichts_ebene())
    assert(1==  @ma24.berichts_ebene())
  end
  
  def test_jahres_gehalt()
    assert_equal(100468.75,@ma1.jahres_gehalt())
    assert_equal(87937.5,@ma3.jahres_gehalt())
    assert_equal(75500.0,@ma4.jahres_gehalt())
    assert_equal(63000.0, @ma21.jahres_gehalt())
    assert_equal(63000.0,@ma23.jahres_gehalt())
    assert_equal(63000.0,@ma24.jahres_gehalt())
    assert_equal(26000.0,@a21.jahres_gehalt())
  end
end