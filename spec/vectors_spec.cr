require "./spec_helper"
include Flatn

describe "Vectors" do
  
  describe "Vec2" do

    it "adds" do
      (Vec2.new(1.0, 2.0) + Vec2.new(3.0, 4.0)).should eq(Vec2.new(4.0, 6.0))
    end
    
    it "subtracts" do
      (Vec2.new(4.0, 6.0) - Vec2.new(3.0, 4.0)).should eq(Vec2.new(1.0, 2.0))
    end
    
    it "scales" do
      (Vec2.new(3.0, 4.0)*2.0).should eq(Vec2.new(6.0, 8.0))
    end
    
    it "divides" do
      (Vec2.new(3.0, 4.0)/2.0).should eq(Vec2.new(1.5, 2.0))
    end

  end
  
  describe "Vec3" do
    
    it "adds" do
      (Vec3.new(1.0, 2.0, 3.0) + Vec3.new(3.0, 4.0, 5.0)).should eq(Vec3.new(4.0, 6.0, 8.0))
    end
    
    it "subtracts" do
      (Vec3.new(4.0, 6.0, 8.0) - Vec3.new(3.0, 4.0, 5.0)).should eq(Vec3.new(1.0, 2.0, 3.0))
    end
    
    it "scales" do
      (Vec3.new(3.0, 4.0, 5.0)*2.0).should eq(Vec3.new(6.0, 8.0, 10.0))
    end
    
    it "divides" do
      (Vec3.new(3.0, 4.0, 5.0)/2.0).should eq(Vec3.new(1.5, 2.0, 2.5))
    end

    it "computes magnitude" do 
      Vec3.new(2.0, 2.0, 2.0).mag.should be_close(3.46410161514, 0.00000001)
    end

    it "normalizes" do 
      Vec3.new(1.0, 2.0, 3.0).normalize.mag.should be_close(1.0, 0.00000001)
    end
  end

end