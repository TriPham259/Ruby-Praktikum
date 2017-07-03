# 26 Pkt
# 4 Pkt für sortiere_absteigend_nach_strasse_hnr

#TODO Klasse um die Methoden ergänzen
class Adresse
  attr_reader :strasse, :hnr, :plz, :ort
  def initialize(strasse,hnr,plz,ort)
    @strasse = strasse
    @hnr = hnr
    @plz = plz
    @ort = ort
  end

  def to_s()
    "A(#@strasse,#@hnr,#@plz,#@ort)"
  end
end

def sortiere_absteigend_nach_strasse_hnr(adresse_ary)
  # TODO
end