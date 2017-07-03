# Summe 8
module ZugKomponente
  
  # TODO enumerierbar machen 1

  attr_reader :nachfolger, :nr
  def initialize(nr=0)
    @nachfolger = nil
    @nr=nr
  end
  
  def ankoppeln(zugkomponente)
    if @nachfolger 
      return false
    end
    if self.equal?(zugkomponente)
      return false
    end
    if  !zugkomponente.is_a?(ZugKomponente) 
      return false
    end
    return true 
  end

  # TODO Iterator 4
  # TODO Methode  nummerieren 3 

end

# Summe 4.5 Pkt
class Lok 
  # TODO 1
  

  # TODO Methode ankoppeln 3.5 
  def ankoppeln(zugkomponente)

  end

  def to_s()
    return "Lok #{nachfolger() ? "-> #{nachfolger} " : "" }"
  end
end

# Summe 8.5
class PersonenWagen
  #TODO 1
  
  # 1.5
  def initialize(klasse)
    #TODO
  end

  def erste_klasse?()
    return @klasse == 1
  end

  def zweite_klasse?()
    return @klasse == 2
  end

  # TODO Methode ankoppeln 6
  def ankoppeln(zugkomponente)
    # TODO
  end

  def to_s()
    return "Wagen #@nr kl=#@klasse #{nachfolger()? "-> #{nachfolger} ":"" }"
  end
end