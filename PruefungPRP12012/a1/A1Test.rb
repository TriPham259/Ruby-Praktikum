require "test/unit"
require "a1/A1"

class A1Test < Test::Unit::TestCase
  def setup()
    @empty_ary = []
    @small_ary = [1,[2,[3]]]
    @big_ary = [1,[3,[4,5]],[[[[]]]],[4],7]
    @empty_hash = {}
    @h1 = {1=>4, 2=> 7, 3=>7}
    @h2 = {4=> 9, 7=> 13, 9=>14}
    @h3 = {1=>9, 2=>13, 3=>13}
  end

  def test_ln_iter()
    assert_in_delta(Math.log(2),ln_iter(2,0),0.03)
    assert_in_delta(Math.log(2),ln_iter(2,1),0.002)
    assert_in_delta(Math.log(2),ln_iter(2,4),2e-6)
    assert_in_delta(Math.log(2),ln_iter(2,10),2e-11)
    assert_in_delta(Math.log(2),ln_iter(2,11),2e-12)
  end

  def test_ln_iter_neg()
    assert(!ln_iter(0,0))
    assert(!ln_iter(-5,0))
    assert(!ln_iter(2,-1))
    assert(!ln_iter(2,-11))
  end

  def test_ln_rek()
    assert_in_delta(Math.log(2),ln_rek(2,0),0.03)
    assert_in_delta(Math.log(2),ln_rek(2,1),0.002)
    assert_in_delta(Math.log(2),ln_rek(2,4),2e-6)
    assert_in_delta(Math.log(2),ln_rek(2,10),2e-11)
    assert_in_delta(Math.log(2),ln_rek(2,11),2e-12)
  end

  def test_ln_rek_neg()
    assert(!ln_rek(0,0))
    assert(!ln_rek(-5,0))
    assert(!ln_rek(2,-1))
    assert(!ln_rek(2,-11))
  end

  def test_ary_plus_depth()
    assert_equal([[0,@empty_ary]],@empty_ary.collect_ary_plus_depth())
    assert_equal([[0,@small_ary],[1,[2,[3]]],[2,[3]]],@small_ary.collect_ary_plus_depth())
    assert_equal([[0,@big_ary],[1,[3,[4,5]]],[2,[4,5]],[1,[[[[]]]]],[2,[[[]]]],[3,[[]]],[4,[]],[1,[4]]],
    @big_ary.collect_ary_plus_depth())
  end

  def pp_ary(a)
    a.each(){|x| p x}
  end

  def test_hash_verknuepfe()
    h1_copy = @h1.clone
    h2_copy = @h2.clone
    assert_equal(@empty_hash,@empty_hash.verknuepfe(@h1))
    assert_equal(@empty_hash,@h1.verknuepfe(@empty_hash))
    assert_equal(@h3,@h1.verknuepfe(@h2))
    assert_equal(h1_copy,@h1)
    assert_equal(h2_copy,@h2)
    assert_equal(@empty_hash,@h1.verknuepfe(@h3))
  end

  def test_hash_injektiv()
    assert(@empty_hash.injektiv?())
    assert(@h2.injektiv?())
    assert(! @h1.injektiv?())
  end

end