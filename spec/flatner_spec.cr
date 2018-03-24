require "./spec_helper"
include Flatn

describe Flatner do

  it "flattens" do 
    model = STLLoader.new.from_file "spec/input/sphere.stl"

    camera = Camera.new()
    flatner = Flatner.new 400, 400, camera
    camera.init_perspective 1.0, 1.0, 0.1, 3.0
    camera.translate Vec3.new(0.0, 0.0, 1.0)

    flat_model = flatner.flatn model
    flat_model.facets.size.should eq(model.facets.size)

    flat_model.facets.each do |facet|
      puts facet.vertices.map(&.to_s).join(' ')
    end
  end


end