require "test/unit"
require "a1/A1"
require "Set"

class A1Test < Test::Unit::TestCase
  def setup()
    @empty_ary = []
    @one_elem_ary = [99]
    @two_elem_ary = [99,-7]
    @nested_ary1 = [1,[2,[3,4],[[7,[8,9]]]]]
    @nested_ary2 = [1,[2,[3,[4,[5]]]]]

    @empty_hash = {}
    @h1 = {:a1 => Set.new([:p1,:p2,:p3,:p4]), :a2 => Set.new([:p1,:p4,:p5,:p6]), :a3 => Set.new([:p1,:p2,:p3]) }
    @h2 = {:a1 => Set.new([:p1,:p2]), :a2 => Set.new([:p3,:p4]), :a3 => Set.new([:p5,:p5])}
    @h1_n_w = {:p5=>Set.new([:a2]), :p1=>Set.new([:a2, :a1, :a3]), :p6=>Set.new([:a2]), :p2=>Set.new([:a1, :a3]), :p3=>Set.new([:a1, :a3]), :p4=>Set.new([:a2, :a1])}

    @h2_n_w = {:p5=>Set.new([:a3]), :p1=>Set.new([:a1]), :p2=>Set.new([:a1]), :p3=>Set.new([:a2]), :p4=>Set.new([:a2])}

    @h1_s_p_w = {:p5=>1, :p1=>3, :p6=>1, :p2=>2, :p3=>2, :p4=>2}
    @h2_s_p_w ={:p5=>1, :p1=>1, :p2=>1, :p3=>1, :p4=>1}

  end

  def test_1_4tel_iter()
    assert_in_delta(1.0/4,f_1_4tel_it(1),0.084)
    assert_in_delta(1.0/4,f_1_4tel_it(2),0.042)
    assert_in_delta(1.0/4,f_1_4tel_it(3),0.026)
    assert_in_delta(1.0/4,f_1_4tel_it(10),0.003788)
    assert_in_delta(1.0/4,f_1_4tel_it(100),4.85342652e-005)
  end

  def test_1_4tel_rek()
    assert_in_delta(1.0/4,f_1_4tel_rek(1),0.084)
    assert_in_delta(1.0/4,f_1_4tel_rek(2),0.042)
    assert_in_delta(1.0/4,f_1_4tel_rek(3),0.026)
    assert_in_delta(1.0/4,f_1_4tel_rek(10),0.003788)
    assert_in_delta(1.0/4,f_1_4tel_rek(100),4.85342652e-005)
  end

  def test_ary_min_2_elems()
    assert_equal(0,@empty_ary.ary_min_2_elems())
    assert_equal(0, @one_elem_ary.ary_min_2_elems())
    assert_equal(1, @two_elem_ary.ary_min_2_elems())
    assert_equal(5, @nested_ary1.ary_min_2_elems())
    assert_equal(4,@nested_ary2.ary_min_2_elems())
  end

  def test_organisiere_nach_wert()
    assert_equal({},organisiere_nach_wert(@empty_hash))
    assert_not_same(@empty_hash,organisiere_nach_wert(@empty_hash))
    assert_equal(@h1_n_w,organisiere_nach_wert(@h1))
    assert_equal(@h2_n_w,organisiere_nach_wert(@h2))
  end

  def test_schluessel_pro_wert()
    assert_equal({},schluessel_pro_wert(@empty_hash))
    assert_not_same(@empty_hash,schluessel_pro_wert(@empty_hash))
    assert_equal(@h1_s_p_w,schluessel_pro_wert(@h1))
    assert_equal(@h2_s_p_w,schluessel_pro_wert(@h2))
  end

end