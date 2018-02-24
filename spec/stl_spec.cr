require "./spec_helper"
include Flatn

describe "STL" do 

  describe "parser" do 

    it "parses the sphere" do 
      model = STLLoader.new.from_file "spec/input/sphere.stl"
      model.name.should eq("sphere")
      model.facets.size.should eq(228)
      facet = model.facets.first
      facet.normal.z.should be_close(-0.988171, 0.00001)
    end

    it "parses the bottle" do 
      model = STLLoader.new.from_file "spec/input/bottle.stl"
      model.name.should eq("FLIRIS")
      model.facets.size.should eq(1240)
    end

  end

end
