require "test/unit"
require "date"

require_relative "A3Kasse"
require_relative "A3KasseHelper"

class A3KasseTest < Test::Unit::TestCase
  def setup()
    srand(1114)
    @rechnungen = KasseHelper.generiere_rechnungen()
    @positionen = KasseHelper.generiere_positionen()
    @kasse = KasseHelper.generiere_kasse()
    @kasse_neg = Marshal.load(Marshal.dump(@kasse)) << @rechnungen.sample()

    @position_neg = Position.new("Nagel",7)
    @positionen_plus_datum = {}
    @positionen.each(){|rechnung| @positionen_plus_datum[rechnung]= DateTime.now()}
    #@positionen_plus_datum.each(){|k,v| puts "#{k}=>#{v}"}

    @rechnung_neg =  Marshal.load(Marshal.dump(@rechnungen[0]))<< Position.new("Pasta verdura",9)
    @rechnungen_plus_datum = {}
    @rechnungen.each(){|rechnung| @rechnungen_plus_datum[rechnung]= DateTime.now()}
    #@rechnungen_plus_datum.each(){|k,v| puts "#{k.to_s(true)}=>#{v}"}

    @dc_rechnungen = Marshal.load(Marshal.dump(@rechnungen))
    @dc_positionen = Marshal.load(Marshal.dump(@positionen))
    @dc_kasse = Marshal.load(Marshal.dump(@kasse))
  end

  def test_position_1
    assert_true(@positionen.include?(@dc_positionen[rand(@dc_positionen.size())]))
  end

  def test_position_1_neg
    assert_false(@positionen.include?(@position_neg))
    assert_false(@positionen.include?(Object.new()))
  end

  def test_position_2
    assert_true(@positionen_plus_datum.has_key?(@dc_positionen[rand(@dc_positionen.size())]))
  end

  def test_position_2_neg
    assert_false(@positionen_plus_datum.has_key?(@position_neg))
    assert_false(@positionen_plus_datum.has_key?(Object.new()))
  end

  def test_position_3
    random_index = rand(0...@positionen.size())
    assert_equal(@positionen[random_index].instance_variable_get(:@produkt),@positionen[random_index].clone().instance_variable_get(:@produkt))
    assert_not_same(@positionen[random_index].instance_variable_get(:@produkt),@positionen[random_index].clone().instance_variable_get(:@produkt))
  end

  def test_rechnung_1
    assert_true(@rechnungen.include?(@dc_rechnungen[rand(@dc_rechnungen.size())]))
  end

  def test_rechnung_1_neg
    assert_false(@rechnungen.include?(@rechnung_neg))
    assert_false(@rechnungen.include?(Object.new()))
    assert_false(@rechnungen.include?(nil))
  end

  def test_rechnung_2
    assert_true(@rechnungen_plus_datum.has_key?(@dc_rechnungen[rand(@dc_rechnungen.size())]))
  end

  def test_rechnung_2_neg
    assert_false(@rechnungen_plus_datum.has_key?(@rechnung_neg))
    assert_false(@rechnungen_plus_datum.has_key?(Object.new()))
    assert_false(@rechnungen_plus_datum.has_key?(nil))
  end

  def test_rechnung_3
    random_index = rand(0...@rechnungen.size())
    positionen_orig = @rechnungen[random_index].instance_variable_get(:@positionen)
    positionen_kopie = @rechnungen[random_index].clone().instance_variable_get(:@positionen)
    random_pos = rand(0...positionen_orig.size())
    #    puts positionen_orig
    #    puts "!!!!!!!!!!!!!!!!"
    #    pust positionen_kopie
    assert_equal(positionen_orig,positionen_kopie)
    assert_not_same(positionen_orig,positionen_kopie)
    assert_equal(positionen_orig[random_pos],positionen_kopie[random_pos])
    assert_not_same(positionen_orig[random_pos],positionen_kopie[random_pos])
  end

  def test_kasse_1
    assert_true([@dc_kasse].include?(@kasse))
  end

  def test_kasse_1_neg
    assert_false([@dc_kasse].include?(@kasse_neg))
    assert_false([@dc_kasse].include?(Object.new()))
    assert_false([@dc_kasse].include?(nil?))
  end

  def test_kasse_2
    assert_true({@dc_kasse=>DateTime.now()}.has_key?(@kasse))
  end

  def test_kasse_2_neg
    assert_false({@dc_kasse=>DateTime.now()}.has_key?(@kasse_neg))
    assert_false({@dc_kasse=>DateTime.now()}.has_key?(Object.new()))  
    assert_false({@dc_kasse=>DateTime.now()}.has_key?(nil))  
  end

  def test_kasse_3
    random_index = rand(0...@kasse.size())
    #    puts @kasse
    #    puts @kasse.clone()
    assert_equal(@kasse.instance_variable_get(:@rechnungen),@kasse.clone().instance_variable_get(:@rechnungen))
    assert_not_same(@kasse.instance_variable_get(:@rechnungen),@kasse.clone().instance_variable_get(:@rechnungen))
    assert_equal(@kasse.instance_variable_get(:@rechnungen)[random_index],@kasse.clone().instance_variable_get(:@rechnungen)[random_index])
    assert_not_same(@kasse.instance_variable_get(:@rechnungen)[random_index],@kasse.clone().instance_variable_get(:@rechnungen)[random_index])
  end
end