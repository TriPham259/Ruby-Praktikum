
class Baum

  # TODO
  
  attr_reader :start_knoten
  protected :start_knoten
  def initialize(inhalt,typ_inhalt)
    @typ_inhalt = typ_inhalt
    check_typ(inhalt)
    @start_knoten = Knoten.new(inhalt)
  end

  def check_typ(inhalt)
    if !inhalt.is_a?(@typ_inhalt)
      raise ArgumentError, "Wert und Typ nicht kompatibel"
    end
  end

  def to_s()
    @start_knoten.to_s(0)
  end

  # AB HIER EIGENE METHODENDEFINITIONEN
  # TODO Inhaltsgleichheit

  # TODO Iterator für Baum

  # TODO Einfuegen von Inhalten
  def einfuegen(eltern_knoten_inhalt,inhalt)

  end

  # TODO 
  def zaehle(inhalt)
   
  end

  # TODO 
  def sortiere()
    
  end

  # TODO Alle Inhalte finden, die die Bdg erfüllen 
  def alle_inhalte_fuer_bdg(&b)
  end

end

class Knoten
  attr_reader :inhalt, :kind_knoten
  protected :kind_knoten
  def initialize(inhalt)
    @inhalt = inhalt
    @kind_knoten = []
  end

  def to_s(tiefe=0)
    size = @kind_knoten.size()
    @linke_knoten = @kind_knoten[0...size/2]
    @rechte_knoten = @kind_knoten[size/2...size]
    return (@rechte_knoten ? @rechte_knoten.map{|k| k.to_s(tiefe+1)}.join("") :"") +
    "#{' '*(tiefe*4)}#@inhalt\n" +
    @linke_knoten.map{|k| k.to_s(tiefe+1)}.join("")
  end

  def <<(inhalt)
    @kind_knoten << Knoten.new(inhalt)
  end

  # AB HIER EIGENE METHODENDEFINITIONEN
  # TODO 

  # TODO Iterator für Knoten 
  def each_node(&b)
  end

   # TODO Iterator für Knoteninhalte
  
  # TODO Ordnungsrelation definieren 2 pkt
  
end