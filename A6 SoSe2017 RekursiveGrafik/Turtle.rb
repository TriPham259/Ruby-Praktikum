require "tk"
require "Leinwand"
require "Point"
require "utils/AnimierteGrafik"

class Turtle
  include AnimierteGrafik

  attr_writer :pos
  attr_writer :angle
  
  # Zu Beginn schaut die Turtle nach Osten (angle = 0)
  #           Gradzahlen werden intern in Bogenmass umgerechnet
  #           und zeichnet bei jeder Bewegung (@down = true)
  def initialize(x,y,angle = 0)
    super()
    @pos = Point.new(x,y)
    @angle = angle*Math::PI / 180
    @down = true
    @stack = []
  end

  # Drehwinkel gegen den Uhrzeigersinn angegeben in Grad
  def turn_left(angle)
    @angle = @angle + angle*Math::PI / 180
  end
  alias :l :turn_left

  # Drehwinkel im Uhrzeigersinn angegeben in Grad
  def turn_right(angle)
    @angle = @angle -angle*Math::PI / 180
  end

  alias :r :turn_right
  # Anzahl Schritte in eingestellte Blickrichtung laufen
  # width ist die Stiftbreite
  def go_ahead(steps,width=1)
    x0 = @pos.x
    y0 = @pos.y
    x1 = (@pos.x + steps*Math.cos(@angle)).round()
    y1 = (@pos.y - steps*Math.sin(@angle)).round()
    if (@down)
      animiere(3) {
        TkcLine.new( Leinwand.gib_einzige_instanz(),x0,y0,x1,y1,:fill => :black, :width => [1,width] .max()) }
    end
    @pos = Point.new(x1,y1)
  end
  
  alias :F :go_ahead
  
  # for L-Systems with branches / remember current state
  def remember()
    @stack<<[@angle,@pos,@down]
  end

  # for L-Systems with branches / restore old state
  def restore()
    state = @stack.pop()
    @angle = state[0]
    @pos = state[1]
    @down = state[2] 
  end
    
  # Zeichenstift absenken
  def down()
    @down = true
  end

  # Zeichenstift anheben
  def up()
    @down  = false
  end

end
