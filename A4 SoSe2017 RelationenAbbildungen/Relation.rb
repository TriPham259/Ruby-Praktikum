require "Potenzmenge"

class Relation
  include Enumerable  # use for mixing in Enumerable Module

  attr_reader :set_a, :set_b

  def initielize(set_a, set_b)
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
  def each (&block)
    @relation.each(&block)
  end

  #============================ R ⊆ A x A ============================
  # für alle a ϵ A, (a,a) ϵ R
  def reflexiv?
    # @relation.include?(a,a)
    @set_a.all? {|elem| include?(Tupel.new(elem,elem))}
  end

  # (a,b) ϵ R => (b,a) ϵ R
  def symmetrisch?
    # für jedes (a,b) ϵ R gibt's (b,a) ϵ R
    all? {|tupel| include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R => (b,a) (not ϵ) R
  def asymmetrisch?
    # für jedes (a,b) ϵ R gibt's kein (b,a) ϵ R
    all? {|tupel| !include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R und (b,a) ϵ R => a = b
  def anti_symmetrisch?
    # für alle (a,b) ϵ R muss es kein (b,a) geben, sonst muss a == b sein
    all? {|tupel| (!include?(Tupel.new(tupel.b,tupel.a))) || (tupel.a == tupel.b)}
  end

  # (a,b) ϵ R und (b,c) ϵ R => (a,c) ϵ R
  def transitiv?
    # für alle (a1,b1) und (a2,b2) ϵ R muss b1 != a2 sein, sonst muss (a1,b2) ϵ R
    all? {|tupel_1|
      all? {|tupel_2|
        (tupel_2.a != tupel_1.b) || include?(Tupel.new(tupel_1.a,tupel_2.b))
      }
    }
  end


  #============================ R ⊆ A x B ============================
  def rechts_eindeutig?

  end

  def links_eundeutig?

  end

  def recht_total?

  end

  def links_total?

  end


end