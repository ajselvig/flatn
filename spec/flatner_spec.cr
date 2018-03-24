require "./spec_helper"
include Flatn

describe Flatner do

  it "flattens" do 
    model = STLLoader.new.from_file "spec/input/sphere.stl"

    width = 600
    height = 600

    camera = Camera.new()
    flatner = Flatner.new camera
    camera.init_perspective 1.5, 1.5, 1.0, 5.0
    camera.translate Vec3.new(0.0, 0.0, 2.5)
    camera.rotate_x -45.0

    flat_model = flatner.flatn model
    # flat_model.facets.size.should eq(model.facets.size)

    renderer = SVGRenderer.new width, height
    filter = WireframeFilter.new flat_model, StrokeStyle.new("#000000", width=0.5)
    filter.render renderer
    renderer.save "spec/output/sphere_wireframe.svg"
  end


end