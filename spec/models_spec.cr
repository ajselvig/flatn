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

  end

end