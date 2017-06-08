require 'test/unit'
require 'Set'
require './Potenzmenge'
require './Tupel'
require './Relation'
require './RelationenGenerator'

class RelationenTest < Test::Unit::TestCase
  # define Fixture
  def setup
    set_a = Set.new([1, 2, 3])
    set_b = Set.new([4, 5, 6, 7])

    @leere_relation = Relation.new(set_a, set_a)
    @set_a = set_a.clone

    #---------------------test-----------------------
    @r_max_aa = Relation.new(set_a, set_a)
    @r_max_aa.add(Tupel.new(1,1)).add(Tupel.new(1,2)).add(Tupel.new(1,3))
    @r_max_aa.add(Tupel.new(2,1)).add(Tupel.new(2,2)).add(Tupel.new(2,3))
    @r_max_aa.add(Tupel.new(3,1)).add(Tupel.new(3,2)).add(Tupel.new(3,3))

    @r_nothing_aa = Relation.new(set_a, set_a)
    @r_nothing_aa.add(Tupel.new(1,2)).add(Tupel.new(3,2)).add(Tupel.new(2,1))

    @r_reflexiv = Relation.new(set_a, set_a)
    @r_reflexiv.add(Tupel.new(1,1)).add(Tupel.new(2,2)).add(Tupel.new(3,3))

    @r_symmetrisch = Relation.new(set_a, set_a)
    @r_symmetrisch.add(Tupel.new(1,3)).add(Tupel.new(3,1)).add(Tupel.new(3,2)).add(Tupel.new(2,3))

    @r_asymmetrisch = Relation.new(set_a, set_a)
    @r_asymmetrisch.add(Tupel.new(1,3)).add(Tupel.new(3,2)).add(Tupel.new(1,2))

    @r_anti_symmetrisch = Relation.new(set_a, set_a)

    @r_anti_symmetrisch.add(Tupel.new(1,1)) .add(Tupel.new(3,3)) .add(Tupel.new(2,3))

    @r_transitiv = Relation.new(set_a, set_a)

    @r_transitiv.add(Tupel.new(1,2)).add(Tupel.new(2,3)).add(Tupel.new(1,3))  .add(Tupel.new(3,2)).add(Tupel.new(2,2)) .add(Tupel.new(3,3))

    #=========== R ⊆ A x B ===========

    @r_nothing_ab = Relation.new(set_a, set_b)

    @r_nothing_ab.add(Tupel.new(1,4)).add(Tupel.new(1,5)).add(Tupel.new(2,5))

    @r_rechts_eindeutig = Relation.new(set_a, set_b)

    @r_rechts_eindeutig.add(Tupel.new(1,4)).add(Tupel.new(2,6)).add(Tupel.new(3,6))

    @r_links_eindeutig = Relation.new(set_a, set_b)

    @r_links_eindeutig.add(Tupel.new(1,4)) .add(Tupel.new(2,5)).add(Tupel.new(2,6))

    @r_rechts_total = Relation.new(set_a, set_b)

    @r_rechts_total.add(Tupel.new(3,4)).add(Tupel.new(1,5)).add(Tupel.new(1,6)).add(Tupel.new(1,7)).add(Tupel.new(3,7))

    @r_links_total = Relation.new(set_a, set_b)

    @r_links_total.add(Tupel.new(1,4)) .add(Tupel.new(2,5)).add(Tupel.new(3,5)).add(Tupel.new(1,7)).add(Tupel.new(3,7))

    #=============== Abschluss von R über A =================

    @r_original = Relation.new(set_b, set_b)

    @r_original.add(Tupel.new(4,5)).add(Tupel.new(5,6)).add(Tupel.new(6,7))

    @a_reflexiv = Relation.new(set_b,set_b)

    @a_reflexiv.add(Tupel.new(4,5)).add(Tupel.new(5,6)).add(Tupel.new(6,7)).add(Tupel.new(4,4)).add(Tupel.new(5,5)).add(Tupel.new(6,6)).add(Tupel.new(7,7))

    @a_symmetrisch = Relation.new(set_b,set_b)

    @a_symmetrisch.add(Tupel.new(4,5)).add(Tupel.new(5,6)).add(Tupel.new(6,7)).add(Tupel.new(5,4)).add(Tupel.new(6,5)).add(Tupel.new(7,6))

    @a_transitiv = Relation.new(set_b,set_b)

    @a_transitiv.add(Tupel.new(4,5)).add(Tupel.new(5,6)).add(Tupel.new(6,7)).add(Tupel.new(4,6)).add(Tupel.new(5,7)).add(Tupel.new(4,7))

  end

  # test for generiere_relation

  def test_generiere_relation
    puts "Gleicheit Relation #{RelationenGenerator.generiere_relation(@set_a,@set_a, @set_a.size*@set_a.size) == @r_max_aa}"
    assert(RelationenGenerator.generiere_relation(@set_a,@set_a, @set_a.size*@set_a.size) == @r_max_aa)

  end

  # test for reflexiv?

  def test_reflexiv

    assert(@r_reflexiv.reflexiv?)

    assert(!@r_nothing_aa.reflexiv?)

    assert(@r_max_aa.reflexiv?)

    assert(!@leere_relation.reflexiv?)

  end

  # test for symmetrisch?

  def test_symmetrisch

    assert(@r_symmetrisch.symmetrisch?)

    assert(!@r_nothing_aa.symmetrisch?)

    assert(@r_max_aa.symmetrisch?)

    assert(@leere_relation.symmetrisch?)

  end

  # test for asymmetrisch?

  def test_asymmetrisch

    assert(@r_asymmetrisch.asymmetrisch?)

    assert(!@r_nothing_aa.asymmetrisch?)

    assert(!@r_max_aa.asymmetrisch?)

    assert(@leere_relation.asymmetrisch?)

  end

  # test for anti_symmetrisch?

  def test_anti_symmetrisch

    assert(@r_anti_symmetrisch.anti_symmetrisch?)

    assert(!@r_nothing_aa.anti_symmetrisch?)

    assert(!@r_max_aa.anti_symmetrisch?)

    assert(@leere_relation.anti_symmetrisch?)

  end

  # test for transitiv?

  def test_transitiv

    assert(@r_transitiv.transitiv?)

    assert(!@r_nothing_aa.transitiv?)

    assert(@r_max_aa.transitiv?)

    assert(@leere_relation.transitiv?)

  end

  # test for rechts_eindeutig?

  def test_rechts_eindeutig

    assert(@r_rechts_eindeutig.rechts_eindeutig?)

    assert(!@r_nothing_ab.rechts_eindeutig?)

    assert(@leere_relation.rechts_eindeutig?)

  end

  # test for links_eindeutig?

  def test_links_eindeutig

    assert(@r_links_eindeutig.links_eindeutig?)

    assert(!@r_nothing_ab.links_eindeutig?)

    assert(@leere_relation.links_eindeutig?)

  end

  # test for rechts_total?

  def test_rechts_total

    assert(@r_rechts_total.rechts_total?)

    assert(!@r_nothing_ab.rechts_total?)

    assert(@leere_relation.rechts_total?)

  end

  # test for links_total?

  def test_links_total

    assert(@r_links_total.links_total?)

    assert(!@r_nothing_ab.links_total?)

    assert(@leere_relation.links_total?)

  end

  # test for reflexiver_abschluss?

  def test_reflexiver_abschluss

    assert(@r_original.reflexiver_abschluss == @a_reflexiv)

  end

  # test for symmetrischer_abschluss?

  def test_symmetrischer_abschluss

    assert(@r_original.symmetrischer_abschluss == @a_symmetrisch)

  end

  # test for transitiver_abschluss?

  def test_transitiver_abschluss

    assert(@r_original.transitiver_abschluss == @a_transitiv)

  end

end