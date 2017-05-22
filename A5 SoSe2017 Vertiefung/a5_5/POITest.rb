require "test/unit"
require_relative "POI"
require "Set"

class POITest < Test::Unit::TestCase
  def setup()
    @coord_eifel = Geokoordinate.new(48.8565056,2.3521334)
    @coord_eifel_diff = Geokoordinate.new(48.8565056,2.4)
    @coord_brandtor = Geokoordinate.new(52.51705655410402,13.393707275390625)
    @coord_colloss = Geokoordinate.new(41.8954656,12.4823243)

    @at_e1 = Attachment.new("EifelVideo","prp1://video:videoeifel1")
    @at_e2 = Attachment.new("EifelImage","prp1://video:videoeifel1_1999")
    @at_e3 = Attachment.new("EifelImage2","prp1://image:imageeifel_night")
    @at_e4 = Attachment.new("EifelImage","prp1://image:imageeifel_summer")

    @at_b1 = Attachment.new("BrandVideo","prp1://video:videobrand1")
    @at_b2 = Attachment.new("BrandImage","prp1://image:imagebrand_night")
    @at_b4 = Attachment.new("BrandImage2","prp1://image:imagebrand_night_2012")
    @at_b3 = Attachment.new("BrandImage","prp1://image:imagebrand_summer")
    @at_b3_diff = Attachment.new("BrandImage1","prp1://image:imagebrand_summer_1")
    @at_b4_diff = Attachment.new("BrandImage2","prp1://image:imagebrand_night")

    @at_c1 = Attachment.new("CollosVideo","prp1://video:videocollos1")
    @at_c2 = Attachment.new("CollosImage","prp1://image:imagecollos_night")
    @at_c3 = Attachment.new("CollosImage2","prp1://image:imagecollos_summer")
    @at_c4 = Attachment.new("CollosImage","prp1://image:imagecollos_summer_2012")

    @poi1 = POI.new("Eifelturm",@coord_eifel)
    @poi2 = POI.new("Brandtor", @coord_brandtor)
    @poi3 = POI.new("Colloss",@coord_colloss)

    @poi1_coord_diff = POI.new("Eifelturm",@coord_eifel_diff)
    @poi1_coord_diff << @at_e1 << @at_e2 << @at_e3 << @at_e4
    
    
    @poi1 << @at_e1 << @at_e2 << @at_e3 << @at_e4
    @poi2 << @at_b1 << @at_b2 << @at_b3 << @at_b4
    @poi3 << @at_c1 << @at_c2 << @at_c3 << @at_c4

    @poi2_clone = Marshal.load(Marshal.dump(@poi2))
    
    @poi2_attachments_diff = Marshal.load(Marshal.dump(@poi2))
    @poi2_attachments_diff << @at_b3_diff << @at_b4_diff

          
    @poi_ary = [@poi3,@poi1,@poi2,@poi1_coord_diff,@poi2_attachments_diff]

    @poi_set = Set.new()
    @poi_set2 = Set.new()
    @poi_set << @poi1 << @poi2 << @poi3
    @poi_set2 << @poi1 << @poi2 << @poi3 

    @poi_ary_sorted = [@poi2_attachments_diff,@poi2,@poi3,@poi1,@poi1_coord_diff]
  end

  def test_find_in_ary
    assert_equal(@poi2,@poi2_clone)
    assert(@poi_ary.include?(@poi2_clone))
  end

  def test_no_dups_in_set()
    @poi_set2 << @poi2_clone
    assert_equal(@poi_set2,@poi_set) 
  end
 
end
