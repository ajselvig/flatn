require "./spec_helper"
include Flatn

describe "Camera" do

  it "projects perspective" do 
    camera = Camera.new
    camera.init_perspective 2.0, 2.0, 1.0, 2.0

    a = Vec4.new 0.0, 0.0, -1.5, 1.0
    a_ndc = camera.eye_to_ndc a
    a_ndc.x.should eq(0.0)
    a_ndc.y.should eq(0.0)

    b = Vec4.new 1.0, 0.0, -1.0, 1.0
    b_ndc = camera.eye_to_ndc b
    b_ndc.x.should eq(1.0)
    b_ndc.y.should eq(0.0)
    b_ndc.z.should eq(-1.0)

    c = Vec4.new 2.0, 2.0, -2.0, 1.0
    c_ndc = camera.eye_to_ndc c
    c_ndc.x.should eq(1.0)
    c_ndc.y.should eq(1.0)
    c_ndc.z.should eq(1.0)

    d = Vec4.new -1.0, 1.0, -2.0, 1.0
    d_ndc = camera.eye_to_ndc d
    d_ndc.x.should eq(-0.5)
    d_ndc.y.should eq(0.5)
    d_ndc.z.should eq(1.0)

    camera.translate Vec3.new(0.0, 0.0, 1.5)

    a = Vec4.new 0.0, 0.0, 0.0, 1.0
    a_ndc = camera.eye_to_ndc a
    a_ndc.x.should eq(0.0)
    a_ndc.y.should eq(0.0)
  end

end