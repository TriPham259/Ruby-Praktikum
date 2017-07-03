require "test/unit"
require "a3/Stockwerk"

class StockwerkTest < Test::Unit::TestCase
  def setup()
    
    @r_separat = Raum.new(:r0,Rechteck.new(Punkt.new(100,100),2,2))
      
    @r1 = Raum.new(:r1,Rechteck.new(Punkt.new(10,5),4,5))
    @r2 = Raum.new(:r2,Rechteck.new(Punkt.new(14,0),7,10))
    @r3 = Raum.new(:r3,Rechteck.new(Punkt.new(20,0),7,10))
    @r4 = Raum.new(:r4,Rechteck.new(Punkt.new(8,10),22,5))
    @r5 = Raum.new(:r5,Rechteck.new(Punkt.new(0,15),13,10))
    @r6 = Raum.new(:r6,Rechteck.new(Punkt.new(23,15),5,20))
    @raeume_geordnet = [@r2,@r3,@r1,@r4,@r5,@r6]
    @st = Stockwerk.new(:st1)
    @bounding_box = Rechteck.new(Punkt.new(0,0),30,35)

    @st << @r5 << @r3 << @r1<< @r6<< @r2<< @r4

  end

  def test_flaeche()
    assert_equal(500,@st.gesamt_flaeche())
  end

  def test_minimal_umgebendes_rechteck()
    assert_equal(@bounding_box,@st.minimal_umgebendes_rechteck());
  end
  
  def test_anordnen_nach_y_x()
    assert_equal(@raeume_geordnet,@st.anordnen_nach_y_x())
  end
  
  def test_raeume_mit_flaeche()
    assert_equal([@r2,@r3],@st.raeume_mit_flaeche(70).sort())
    assert_equal([@r1], @st.raeume_mit_flaeche(20))
    assert_equal([], @st.raeume_mit_flaeche(50))
  end
  
  def test_kleinster_raum()
    assert_equal(@r1,@st.kleinster_raum())
  end
  
  def test_raum_mit_massen?()
    assert(@st.raum_mit_massen?(@r3,0))
    assert(@st.raum_mit_massen?(@r3,10))
    assert(@st.raum_mit_massen?(@r_separat,3))      
    assert(!@st.raum_mit_massen?(@r_separat,2))
  end
end