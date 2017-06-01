require './Potenzmenge.rb'
require './Tupel.rb'

class Relation
  include Enumerable  # use for mixing in Enumerable Module
  attr_reader :set_a, :set_b
  def initialize(set_a , set_b )
    #make sure arguments are Set
    raise 'Ungültige Parameter' if !set_a.is_a?(Set) || !set_b.is_a?(Set)

    @set_a = set_a.clone
    @set_b = set_b.clone
    @relation = Set.new
  end

  def add(tupel)
    #make sure argument is Tupel
    if tupel.is_a?(Tupel)
      #make sure Tupel is valid (Tupel is element of (set_a x set_b) )
      if set_a.include?(tupel.a) && set_b.include?(tupel.b)
        @relation.add(tupel)
      end
    end

    # return old Relation if Tupel is not valid
    self
  end

  def size
    @relation.size
  end

  # mix in Enumerable's methods
  def each(&block)
    @relation.each(&block)
  end

  #============================ R ⊆ A x A ============================
  # für alle a ϵ A, (a,a) ϵ R
  def reflexiv?()
    # @relation.include?(a,a)
    if @set_a.all? {|elem| @relation.include?(Tupel.new(elem,elem))}
      #    @set_a.each{|elem| return false if !@relation.include?(Tupel.new(elem,elem))}
      return true
    else
      return false

    end
  end

  # (a,b) ϵ R => (b,a) ϵ R
  def symmetrisch?
    # für jedes (a,b) ϵ R gibt's (b,a) ϵ R
    @relation.all? {|tupel| @relation.include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R => (b,a) (not ϵ) R
  def asymmetrisch?
    # für jedes (a,b) ϵ R gibt's kein (b,a) ϵ R
    @relation.all? {|tupel| !@relation.include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R und (b,a) ϵ R => a = b
  def anti_symmetrisch?
    # für alle (a,b) ϵ R muss es kein (b,a) geben, sonst muss a == b sein
    @relation.all? {|tupel| (!@relation.include?(Tupel.new(tupel.b,tupel.a))) || (tupel.a == tupel.b)}
  end

  # (a,b) ϵ R und (b,c) ϵ R => (a,c) ϵ R
  def transitiv?
    # für alle (a1,b1) und (a2,b2) ϵ R muss b1 != a2 sein, sonst muss (a1,b2) ϵ R
    @relation.all? {|tupel_1|
      @relation.all? {|tupel_2|
        (tupel_2.a != tupel_1.b) || @relation.include?(Tupel.new(tupel_1.a,tupel_2.b))
      }
    }
  end

  #============================ R ⊆ A x B ============================
  # für alle a ϵ A, (a,b) ϵ R und (a,c) ϵ R => b = c
  def rechts_eindeutig?
    # für alle (a1,b1) und (a2,b2) gibt es NUR EINE a1 == a2
    @relation.all? {|tupel_1|
      @relation.one? {|tupel_2|
        tupel_1.a == tupel_2.a
      }
    }
  end

  # für alle a ϵ A, (b,a) ϵ R und (c,a) ϵ R => b = c
  def links_eindeutig?
    # für alle (a1,b1) und (a2,b2) gibt es NUR EINE b1 == b2
    @relation.all? {|tupel_1|
      @relation.one? {|tupel_2|
        tupel_1.b == tupel_2.b
      }
    }
  end

  # für alle b ϵ B, existiert a ϵ A mit (a,b) ϵ R
  def recht_total?
    return true if @relation.size == 0

    # für alle b ϵ B, existiert (a,b') ϵ R: b' = b
    @set_b.all? {|elem|
      @relation.any? {|tupel| tupel.b == elem}
    }
  end

  # für alle a ϵ A, existiert b ϵ B mit (a,b) ϵ R
  def links_total?
    return true if @relation.size == 0

    # für alle a ϵ A, existiert (a',b) ϵ R: a' = a
    @set_a.all? {|elem|
      @relation.any? {|tupel| tupel.a == elem}
    }
  end

  # -----------Verknüpfen: R1 ⊆ A x B, R2 ⊆ B x C, R1 o R2 ⊆ A x C-------------
  def verknuepfe(andere_relation)
    raise 'Parameter ist keine Relation.' unless andere_relation.is_a?(Relation)
    raise 'Kann nicht verknüpfen.' unless set_b == andere_relation.set_a

    new_relation = Relation.new(set_a, andere_relation.set_b)

    # add new Tupel when tupel_1.b == tupel_2.a
    @relation.each {|tupel_1|
      andere_relation.each {|tupel_2|
        new_relation.add(Tupel.new(tupel_1.a, tupel_2.b)) if tupel_1.b == tupel_2.a
      }
    }

    new_relation
  end

  # --------------------Abschlüsse-----------------
  def kopiere
    clone_relation = Relation.new(set_a, set_b)

    # copy Tupels from current Relation to clone Relation
    @relation.each {|tupel| clone_relation.add(tupel)}

    clone_relation
  end

  def reflexiver_abschluss
    # only work for R ⊆ A x A
    raise 'Zwei Wertenbereiche müssen identisch sein.' unless set_a == set_b

    # nicht destruktiv => make a clone
    clone_relation = kopiere

    # add reflexive Tupels to clone_relation
    set_a.each {|elem| clone_relation.add(Tupel.new(elem,elem))}

    clone_relation
  end

  def symmetrischer_abschluss
    # only work for R ⊆ A x A
    raise 'Zwei Wertenbereiche müssen identisch sein.' unless set_a == set_b

    # nicht destruktiv => make a clone
    clone_relation = kopiere

    # add symmetrische Tupel to clone_relation
    clone_relation.to_a.each {|tupel| clone_relation.add(Tupel.new(tupel.b,tupel.a))}

    clone_relation
  end

  def transitiver_abschluss
    # only work for R ⊆ A x A
    raise 'Zwei Wertenbereiche müssen identisch sein.' unless set_a == set_b

    # nicht destruktiv => make a clone
    clone_relation = kopiere

    # add transitive Tupel to clone_relation until it's transitiv
    until clone_relation.transitiv?
      clone_relation.to_a.each {|tupel_1|
        clone_relation.to_a.each {|tupel_2|
          clone_relation.add(Tupel.new(tupel_1.a,tupel_2.b)) if tupel_1.b == tupel_2.a
        }
      }
    end

    clone_relation
  end

  # Inverse Relation zu R ⊆ A x B
  def invertiere
    # R^(-1) ⊆ B x A
    new_relation = Relation.new(set_b, set_a)

    @relation.each {|tupel|
      new_relation.add(Tupel.new(tupel.b, tupel.a))
    }

    new_relation
  end

  # Abbildung
  def abbildung?
     links_total? && rechts_eindeutig?
  end

  def injektiv?
    abbildung? && links_eundeutig?
  end

  def surjektiv?
    abbildung? && rechts_total?
  end

  def urbild
    # make sure Relation is Abbildung
    raise 'Die Relation ist keine Abbildung.' unless abbildung?

    # create Relation urbild from Potenzmenge of set_b to Pootenzmenge of set_a
    p_set_a = set_a.potenzmenge
    p_set_b = set_b.potenzmenge
    urbild_rel = Relation.new(p_set_b, p_set_a)

    # find the Urbildmenge for every subset of set_b
    p_set_b.each {|subset_b|
      subset_a = Set.new(
          set_a.select{ |elem|
            self.any? { |tupel| elem == tupel.a && subset_b.include?(tupel.b)}
          }
      )
      urbild_rel.add(Tupel.new(subset_b, subset_a))
    }

    urbild_rel
  end

  def to_s
    # return empty Relation when Relation's size equal 0
    return 'Relation{}' if size == 0

    # map elements from Relation to an array
    relation_s = "Relation{#{@relation.map { |x| x.to_s }}}"

    #     remove square brackets and double quotes
    relation_s.delete('[]"')
  end

end

# t = Relation.new(Set.new([1,2,3]), Set.new([1,2,3]))
#
# t.add(Tupel.new(1,1))
# t.add(Tupel.new(1,2))
# t.add(Tupel.new(1,3))
# t.add(Tupel.new(2,3))
#
#
# puts t.transitiv?
# puts t.reflexiv?
#
# puts t.to_s

# t = Relation.new(Set.new([1,2,3]),Set.new([1,2,3]))
# t1 = Tupel.new(1,1)
# t2 = Tupel.new(2,2)
# t3 = Tupel.new(5,5)
# t.add(t1)
# t.add(t2)
# t.add(t3)
# puts t.to_s
#puts t.reflexiv?
#puts t.symmetrisch?
#puts t.asymmetrisch?
#puts t.anti_symmetrisch?
#puts t.transitiv?
#puts t.rechts_eindeutig?
#puts t.links_eindeutig?
#puts t.rechts_total?
#puts t.links_total?

# z = Relation.new(Set.new([1,2,3]),Set.new([1,2,3]))
# t1 = Tupel.new(2,3)
# t2 = Tupel.new(1,2)
# t3=Tupel.new(3,1)
# z.add(t1)
# z.add(t2)
# z.add(t3)
# puts z.to_s
#puts z.reflexiv?
#puts z.symmetrisch?
#puts z.asymmetrisch?
#puts z.anti_symmetrisch?
#puts z.transitiv?
#puts z.rechts_eindeutig?
#puts z.links_eindeutig?
#puts z.rechts_total?
#puts z.links_total?

#y = t.verknuepfe(z)
#puts y.to_s

u = Relation.new(Set.new([1,2,3]),Set.new([3,4]))
u1 = Tupel.new(1,3)
u2 = Tupel.new(2,4)
u3 = Tupel.new(3,3)
u.add(u1).add(u2).add(u3)
puts u.to_s
puts u.urbild.to_s
