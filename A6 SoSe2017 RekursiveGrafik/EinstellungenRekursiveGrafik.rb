$CLASSES = [:RekursiverBaum, :Turtle,:KochKurve,:DrachenKurve,:HilbertKurve,:GosperKurve,:McWorterPentigree,:LevyFraktal]

# DAS IST EIN GANZ UEBLER HACK,
# Hier wird der Tatsache Tribut gezollt, dass es in Ruby keinen Zugriff
# auf den Parsetree gibt und es keine cleveren Verfahren gibt, um den Typ
# von Objekten aus dem Quelltext abzuleiten

# NICHT BEACHTET WIRD HIER u.A.
# Vererbung von Methoden
# Methoden mit variablen Argumentlisten
# Methoden mit Parameter Defaults
# um nur einiges zu nennen

$METHOD_CONFIG = {
  :KochKurve => {
  :zeichnen => {:label => ":zeichnen(...)",
  :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer],[:kl,:Integer]] },
  :loeschen => {:label => ":loeschen()"}
  },
  :DrachenKurve => {
  :zeichnen => {:label => ":zeichnen(...)",
  :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer],[:kl,:Integer]] },
  :loeschen => {:label => ":loeschen()"}
  },
  :HilbertKurve => {
  :zeichnen => {:label => ":zeichnen(...)",
  :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer],[:kl,:Integer]] },
  :loeschen => {:label => ":loeschen()"}
  },
  :GosperKurve => {
  :zeichnen => {:label => ":zeichnen(...)",
  :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer],[:kl,:Integer]] },
  :loeschen => {:label => ":loeschen()"}
  }, 
  :McWorterPentigree => {
  :zeichnen => {:label => ":zeichnen(...)",
  :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer],[:kl,:Integer]] },
  :loeschen => {:label => ":loeschen()"}
  }, 
  :LevyFraktal => {
  :zeichnen => {:label => ":zeichnen(...)",
  :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer],[:kl,:Integer]] },
  :loeschen => {:label => ":loeschen()"}
  }, 
  :RekursiverBaum => {
  :zeichnen => {:label => ":zeichnen(...)",
  :args => [[:typ,:Integer],[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer]] },
  :loeschen => {:label => ":loeschen()"}
  },
  :Turtle => {
  :go_ahead => {:label => "go_ahead(...)", :args => [[:steps, :Integer],[:width,:Integer]]},
  :back => {:label => "back(...)", :args => [[:steps, :Integer],[:width,:Integer]]},
  :up => {:label => "up()"},
  :down => {:label => "down()"},
  :turn_left => {:label=> "turn_left(...)", :args => [[:angle, :Integer]]},
  :turn_right => {:label=> "turn_right(...)", :args => [[:angle, :Integer]]}
  },
  :KochKurve_class => { :new => { :label => :'new()'}},
  :DrachenKurve_class => { :new => { :label => :'new()'}},
  :HilbertKurve_class => { :new => { :label => :'new()'}},
  :RekursiverBaum_class => { :new => { :label => :'new()'}},
  :GosperKurve_class => {:new => {:label  => :'new()'}},
  :McWorterPentigree_class => {:new => {:label  => :'new()'}},
  :LevyFraktal_class => {:new => {:label  => :'new()'}},
  :Turtle_class => { :new => { :label => :'new()', :args => [[:x,:Integer],[:y,:Integer]]}}
}