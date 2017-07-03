require "test/unit"
require "a2/Wuerfel"
require "Set"

class WuerfelTest < Test::Unit::TestCase
  def setup()
    @w1 = Wuerfel.new(1)
    @w1_0 = Wuerfel.new(1.0)
    @w2 = Wuerfel.new(2)
    @w3 = Wuerfel.new(3)
    @w3_0 = Wuerfel.new(3.0)
    @w4 = Wuerfel.new(4)
    @w1double = Wuerfel.new(1)
    @w1_0double = Wuerfel.new(1.0)

    @w_ary = [@w4,@w1_0,@w1,@w1_0,@w2,@w3]
    @w_hash = {@w1 => 1, @w1_0 => 1.0 , @w3 => 3}
    @w_set = Set.new([@w1,@w2])
    @control_set = Set.new([@w1,@w2])
  end

  def test_finde_in_ary()
    assert(@w_ary.include?(@w1double))
    assert(@w_ary.include?(@w1_0double))
    assert(@w_ary.include?(@w3_0))
    assert_equal(3,zaehle_obj(@w1))
    assert_equal(1,zaehle_obj(@w3_0))
  end

  def test_keine_dubletten
    assert_equal(@control_set,@w_set<< @w1)
    assert_equal(@control_set<<@w3,@w_set<<@w3)
    assert_not_equal(@control_set,@w_set<<@w1_0)
  end

  def test_schluessel_im_hash
    assert_equal(1,@w_hash[@w1double])
    assert_equal(1.0,@w_hash[@w1_0double])
    assert(!@w_hash[@w3_0])
    @w_hash[@w3_0] = 3.0
    assert_equal(3.0,@w_hash[@w3_0])
    assert_equal(3,@w_hash[@w3])
  end

  def test_sortieren()
    assert_equal([@w1_0,@w1_0,@w1,@w2,@w3,@w4], @w_ary.sort())
    assert_raises(NoMethodError){(@w_ary << 3).sort}
  end

  def test_vergleich()
    assert(@w1 <= @w1_0)
    assert(@w1 < @w2)
    assert(@w1 == @w1_0)
    assert(@w4 > @w3)
    assert(@w4 > @w3)
    assert(@w3.between?(@w1,@w4))
  end

  def zaehle_obj(obj)
    t_ary = @w_ary.clone()
    obj_count = 0
    while not t_ary.empty?
      index = @w_ary.find_index(obj)
      obj_count +=1
      t_ary = t_ary[index+1..t_ary.size()]
    end
    return obj_count
  end

end