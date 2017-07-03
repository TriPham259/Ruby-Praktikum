require "a1"
require "test/unit"
require "Set"

class A2Test < Test::Unit::TestCase
  def setup()
    @bestell_hash = {"knr1" => [12,12,12.78,12], "knr2" => [24,56,788.9, 30], "knr3"=>[1,1,1,1,4]}
    @one_elem_hash = {"knr1" => [12,12,12.78,12]}
    @ary = [1,2,3.0,["a", [4.0,"b"], [[[5]]]], ["c",[]]]

    @delta_2_1 = 0.2   # für ln(2)
    @delta_2_3 = 0.03
    @delta_2_30 = 3e-11

    @delta_0_7_1 = 0.072 # für ln(0.7)
    @delta_0_7_3 = 6.3e-3
    @delta_0_7_30 = 8.92e-14
  end

  def test_sum
    assert_equal(0,sum(1,1))
    assert_equal(0,sum(1,3))
    assert_equal(0,sum(1,100))

    assert_in_delta(Math.log(2),sum(2,1),@delta_2_1,"Falscher Startwert fuer i")
    assert_in_delta(Math.log(2), sum(2,3),@delta_2_3, "Berechnug nicht praezise genug im 3'ten Schritt")
    assert_in_delta(Math.log(2), sum(2,30),@delta_2_30, "Berechnug nicht praezise genug im 30'ten Schritt")
    assert_in_delta(Math.log(0.7),sum(0.7,1),@delta_0_7_1,"Falscher Startwert fuer i")
    assert_in_delta(Math.log(0.7), sum(0.7,3),@delta_0_7_3, "Berechnug nicht praezise genug im 3'ten Schritt")
    assert_in_delta(Math.log(0.7), sum(0.7,30),@delta_0_7_30, "Berechnug nicht praezise genug im 30'ten Schritt")
    assert_raise(ArgumentError){sum(0.5,100)}
    assert_raise(ArgumentError){sum(-1,100)}
    assert_raise(ArgumentError){sum(2,0)}
  end

  def test_rek_count_type()
    assert_equal(5,@ary.rek_count_type(Numeric))
    assert_equal(2, @ary.rek_count_type(Float))
    assert_equal(3, @ary.rek_count_type(Integer))
    assert_equal(0,@ary.rek_count_type(Hash))
    assert_equal(7,@ary.rek_count_type(Array))
  end

  def test_max_bestellwert()
    assert_equal("knr2",max_bestellwert(@bestell_hash))
    assert_equal("knr1",max_bestellwert(@one_elem_hash))
  end
end