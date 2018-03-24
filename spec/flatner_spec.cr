require "./spec_helper"
include Flatn

describe Flatner do

  it "flattens" do 
    model = STLLoader.new.from_file "spec/input/sphere.stl"

    width = 600
    height = 600

    camera = Camera.new()
    flatner = Flatner.new camera
    camera.perspective 1.5, 1.5, 1.0, 5.0
    camera.translate 0.0, 0.0, 2.5
    camera.rotate_x -45.0

    flat_model = flatner.flatn model
    flat_model.facets.size.should be < model.facets.size
  end


end