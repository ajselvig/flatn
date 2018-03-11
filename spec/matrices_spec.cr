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

describe "Matrix4" do
  
  it "adds" do 
    sum = Matrix4.unit + Matrix4.unit
    sum.w3.should eq(2.0)
  end
  
  it "subtracts" do 
    diff = Matrix4.unit - Matrix4.unit
    diff.w3.should eq(0.0)
  end
  
  it "multiplies" do 
    a = Matrix4.new 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0
    b = Matrix4.new 16.0, 15.0, 14.0, 13.0, 12.0, 11.0, 10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0
    prod = a * b
    prod.x0.should eq(80.0)
    prod.x1.should eq(70.0)
    prod.x2.should eq(60.0)
    prod.x3.should eq(50.0)
    prod.y0.should eq(240.0)
    prod.y1.should eq(214.0)
    prod.y2.should eq(188.0)
    prod.y3.should eq(162.0)
    prod.z0.should eq(400.0)
    prod.z1.should eq(358.0)
    prod.z2.should eq(316.0)
    prod.z3.should eq(274.0)
    prod.w0.should eq(560.0)
    prod.w1.should eq(502.0)
    prod.w2.should eq(444.0)
    prod.w3.should eq(386.0)
  end

end