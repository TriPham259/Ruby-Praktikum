require "a2"
require "test/unit"
require "Set"

class A2Test < Test::Unit::TestCase
  def setup()
    @a1 = Adresse.new("Berliner Tor", "5", "20099", "Berlin")
    @a2 = Adresse.new("Berliner Tor", "5", "20099", "Hamburg")
    @a3 = Adresse.new("Berliner Tor", "3", "20097", "Hamburg")
    @a4 = Adresse.new("Badeteich", "5", "20099", "Hamburg")
    @a5 = Adresse.new("Fantasie", "5", "20099", "Hamburg")

    @a1_clone = @a1.clone()
    @a2_clone = @a2.clone()
    @other = 35
    @set1 = Set.new()
    @ary_sorted = [@a3,@a1,@a4,@a2,@a5]
    @ary_sorted_absteigend_strasse_hnr = [@a5,@a2,@a1,@a3,@a4]
    @ary = [@a5,@a2,@a3,@a1,@a4]
  end

  def test_mit_mengen()
    assert(@set1.add?(@a1))
    assert(@set1.include?(@a1_clone))
    assert(!@set1.add?(@a1_clone))
    assert(@set1.add?(@a2))
  end

  def test_mit_array()
    assert_equal(3,@ary.index(@a1_clone))
    assert_equal(1,@ary.index(@a2_clone))
  end

  def test_sortieren()
    assert_raise(ArgumentError){ (@ary + [@other]).sort()}
    assert_equal(@ary_sorted, @ary.sort())
  end

  def test_vergleich()
    assert_nothing_raised(){@a1 <= @a1}
    assert_nothing_raised(){!(@a3 > @a1)}
    assert_nothing_raised(){@a1 >= @a1}
    assert_nothing_raised(){@a3 < @a1}
    assert_nothing_raised(){@a1.between?(@a3,@a4)}
    assert(@a1 <= @a1)
    assert(!(@a3 > @a1))
    assert(@a1 >= @a1)
    assert(@a3 < @a1)
    assert(@a1.between?(@a3,@a4))
  end

  def test_not_directly_implemented()
    assert_not_equal(Adresse,@a1.method(:<).owner())
    assert_not_equal(Adresse,@a1.method(:<=).owner())
    assert_not_equal(Adresse,@a1.method(:>).owner())
    assert_not_equal(Adresse,@a1.method(:>=).owner())
    assert_not_equal(Adresse,@a1.method(:between?).owner())
  end

  def test_sortiere_absteigend_nach_strasse_hnr()
    assert_equal(@ary_sorted_absteigend_strasse_hnr,sortiere_absteigend_nach_strasse_hnr(@ary))
  end
end