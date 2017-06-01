require './Relation.rb'
require './Tupel.rb'
require 'Set'

class RelationenGenerator
  def RelationenGenerator.generiere_relation(set_a,set_b,k)
    # create new Relation from 2 Sets
    relation = Relation.new(set_a,set_b)

    # report if k is not valid (valid: k <= max_tupels)
    max_tupels = set_a.size * set_b.size # max size of relation = |A x B| = |A| x |B|
    raise 'k muss <= maximale Anzahl der Tupels sein.' if k > max_tupels

    # add k random Tupels to relation
    while relation.size < k
      # get 1 random element from each Set to make a Tupel
      rand_a = rand(set_a.size)                                        # "index" of a random element
      rand_b = rand(set_b.size)
      relation.add(Tupel.new(set_a.to_a[rand_a], set_b.to_a[rand_b]))  #no "index" for Set => change to array to call by index
    end

    relation
  end

end
#  def RelationenGenerator.generiere_abbildung(set_a,set_b)
#    #TODO
#    relation = Relation.new(set_a,set_b)
#    
#      rand_a = rand(set_a.size)                                        # "index" of a random element
#      rand_b = rand(set_b.size)
#      
#      relation.add(Tupel.new(set_a.to_a[rand_a], set_b.to_a[rand_b]))
#
#    if relation.abbildung?
#      return relation
#    else
#      puts 'Keine Abbildung.'
#    end
#  end
#end


