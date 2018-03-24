require "./spec_helper"
include Flatn

describe "Models" do 

  describe "Facet" do 

    it "Can only contain 3 vertics" do 
      expect_raises Exception do
        Facet.new([] of Vec3, Vec3.x_unit)
      end
      Facet.new([Vec3.unit, Vec3.unit, Vec3.unit], Vec3.x_unit).should be_a(Facet)
    end

    it "normalizes normal" do 
      facet = Facet.new([Vec3.new(1.0, 2.0, 3.0), Vec3.unit, Vec3.unit], Vec3.new(3.0, 2.0, 1.0))
      facet.normal.mag.should eq(1.0)
    end

  end

end