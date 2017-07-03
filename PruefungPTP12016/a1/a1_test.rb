require "test/unit"

require_relative "a1"

class A1Test < Test::Unit::TestCase
  def setup()

    @x_boundary = 0.51
    @x = 2

    @delta1 = 0.193147181 #05599453
    @delta30 = 2.915645503e-11 #8100936
    @delta_boundary1 = 0.287439761 #04617245
    @delta_boundary30 = 0.00483520193 # 23369503

    @empty_ary = []
    @nested_ary = [[[[1]]],8,{7=>"einzeln", 5 => [13]}]
    @deep_group_of_nested_ary = {Array=>[[[[1]]], [[1]], [1]], Fixnum=>[1, 8], Hash=>[{7=>"einzeln", 5=>[13]}]}

    @multi_value_hash = {:best1 => [:thetas, :myo, :hololens],
      :best2 => [:gear_360, :soli, :vive] ,
      :best3 => [:thetas, :gear_360, :myo] }
    @multi_value_hash_reverse = {
      :thetas=>[:best1, :best3],
      :myo=>[:best1, :best3],
      :hololens=>[:best1],
      :gear_360=>[:best2, :best3],
      :soli=>[:best2], :vive=>[:best2]}
    @multi_empty_value_hash = {:best1 => [],
      :best2 => []
    }
    @empty_hash = {}
  end

  def test_ln_i_neg()
    assert_raises(ArgumentError) {ln_i(0.5,1)}
    assert_raises(ArgumentError) {ln_i(0,1)}
    assert_raises(ArgumentError) {ln_i(2.7,0)}
    assert_raises(ArgumentError) {ln_i(2,-2)}
    assert_raises(ArgumentError) {ln_i(2,2.7)}
    assert_raises(ArgumentError) {ln_i(:a,1)}
    assert_raises(ArgumentError) {ln_i(1,:a)}
  end

  def test_ln_i()
    assert_in_delta(Math.log(@x_boundary),ln_i(@x_boundary,1),@delta_boundary1)
    assert_in_delta(Math.log(@x_boundary),ln_i(@x_boundary,30),@delta_boundary30)
    assert_in_delta(Math.log(@x),ln_i(@x,1),@delta1)
    assert_in_delta(Math.log(@x),ln_i(@x,30),@delta30)
  end

  def test_ln_r_neg()
    assert_raises(ArgumentError) {ln_r(0.5,1)}
    assert_raises(ArgumentError) {ln_r(0,1)}
    assert_raises(ArgumentError) {ln_r(2.7,0)}
    assert_raises(ArgumentError) {ln_r(2,-2)}
    assert_raises(ArgumentError) {ln_r(2,2.7)}
    assert_raises(ArgumentError) {ln_r(:a,1)}
    assert_raises(ArgumentError) {ln_r(1,:a)}
  end

  def test_ln_r()
    assert_in_delta(Math.log(@x_boundary),ln_r(@x_boundary,1),@delta_boundary1)
    assert_in_delta(Math.log(@x_boundary),ln_r(@x_boundary,30),@delta_boundary30)
    assert_in_delta(Math.log(@x),ln_r(@x,1),@delta1)
    assert_in_delta(Math.log(@x),ln_r(@x,30),@delta30)
  end

  def test_ary_deep_group_by_class()
    assert_equal(@deep_group_of_nested_ary,@nested_ary.deep_group_by_class())
    assert_equal(@empty_hash,@empty_ary.deep_group_by_class())
  end

  def test_multi_value_reverse()
    assert_equal(@multi_value_hash_reverse,multi_value_reverse(@multi_value_hash))
    assert_equal(@empty_hash,multi_value_reverse(@multi_empty_value_hash))
    assert_equal(@empty_hash, multi_value_reverse(@empty_hash))
  end

  def test_multi_value_reverse_neg()
    require "Set"
    assert_raises(ArgumentError) {multi_value_reverse(@nested_ary)}
    assert_raises(ArgumentError) {multi_value_reverse(Object.new())}
    assert_raises(ArgumentError) {multi_value_reverse(Set.new())}
    assert_raises(ArgumentError) {multi_value_reverse(nil)}
  end
end