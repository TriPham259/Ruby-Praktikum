require "utils/AnimationTimer"
require "Leinwand"

module AnimierteGrafik
  
  def initialize()
    @animation = AnimationTimer.new()
    #Leinwand.gib_einzige_instanz().radieren()
  end
  
  def loeschen()
    Leinwand.gib_einzige_instanz().radieren()
    @animation.reset()
  end
  
  def restart()
    @animation.reset()
  end
  
  def animiere(frequenz,&b)
    @animation.next(frequenz,&b)
  end
end