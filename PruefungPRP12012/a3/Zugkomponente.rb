# Summe 8
module ZugKomponente

  # TODO enumerierbar machen 1
  include Enumerable

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
  def each(&block)
    
  end
  # TODO Methode  nummerieren 3
  def nummerieren(nr)
  
  end
  
  
end

# Summe 4.5 Pkt
class Lok
  # TODO 1
  include ZugKomponente
  # TODO Methode ankoppeln 3.5
  def ankoppeln(zugkomponente)
    if super(zugkomponente) && zugkomponente.is_a?(PersonenWagen)
      nachfolger = zugkomponente
      nr += 1
      return true
    end
    return false
  end

  def to_s()
    return "Lok #{nachfolger() ? "-> #{nachfolger} " : "" }"
  end
end

# Summe 8.5
class PersonenWagen
  attr_reader  :klasse
  #TODO 1
  include ZugKomponente
  # 1.5
  def initialize(klasse)
    @klasse = klasse
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
    if super(zugkomponente) && zugkomponente.is_a?(PersonenWagen) && zugkomponente.klasse >= self.klasse  
      nachfolger = zugkomponente
      nr += 1
      return true
    end
    return false
  end

  def to_s()
    return "Wagen #@nr kl=#@klasse #{nachfolger()? "-> #{nachfolger} ":"" }"
  end
end