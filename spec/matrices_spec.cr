require "./spec_helper"
include Flatn

describe "Matrix3" do
  
  it "adds" do 
    sum = Matrix3.unit + Matrix3.unit
    sum.x0.should eq(2.0)
  end
  
  it "subtracts" do 
    diff = Matrix3.unit - Matrix3.unit
    diff.x0.should eq(0.0)
  end
  
  it "multiplies" do 
    a = Matrix3.new 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0
    b = Matrix3.new 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0
    prod = a * b
    prod.x0.should eq(30.0)
    prod.x1.should eq(24.0)
    prod.x2.should eq(18.0)
    prod.y0.should eq(84.0)
    prod.y1.should eq(69.0)
    prod.y2.should eq(54.0)
    prod.z0.should eq(138.0)
    prod.z1.should eq(114.0)
    prod.z2.should eq(90.0)
  end

end