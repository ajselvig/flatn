require "./spec_helper"
include Flatn

describe "Geom" do
  
  it "adds Vec2s" do
    (Vec2.new(1.0, 2.0) + Vec2.new(3.0, 4.0)).should eq(Vec2.new(4.0, 6.0))
  end
  
  it "subtracts Vec2s" do
    (Vec2.new(4.0, 6.0) - Vec2.new(3.0, 4.0)).should eq(Vec2.new(1.0, 2.0))
  end
  
  it "scales Vec2s" do
    (Vec2.new(3.0, 4.0)*2.0).should eq(Vec2.new(6.0, 8.0))
  end
  
  it "divides Vec2s" do
    (Vec2.new(3.0, 4.0)/2.0).should eq(Vec2.new(1.5, 2.0))
  end
  
  it "adds Vec3s" do
    (Vec3.new(1.0, 2.0, 3.0) + Vec3.new(3.0, 4.0, 5.0)).should eq(Vec3.new(4.0, 6.0, 8.0))
  end
  
  it "subtracts Vec3s" do
    (Vec3.new(4.0, 6.0, 8.0) - Vec3.new(3.0, 4.0, 5.0)).should eq(Vec3.new(1.0, 2.0, 3.0))
  end
  
  it "scales Vec3s" do
    (Vec3.new(3.0, 4.0, 5.0)*2.0).should eq(Vec3.new(6.0, 8.0, 10.0))
  end
  
  it "divides Vec3s" do
    (Vec3.new(3.0, 4.0, 5.0)/2.0).should eq(Vec3.new(1.5, 2.0, 2.5))
  end

end