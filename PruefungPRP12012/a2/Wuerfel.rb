# Summe 26 Pkt + 4 Pkt fuer vollstaendige Gesamtloesung
class Wuerfel
  include Comparable
  attr_reader :laenge
  def initialize(laenge)
    @laenge = laenge
  end

  def to_s
    "Wuerfel mit Laenge #{laenge}"
  end

  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    laenge == other.laenge
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    laenge.eql?(other.laenge)
  end
  
  def hash 
    laenge.hash
  end
  
  def <=> other
    laenge <=> other.laenge
  end
end



