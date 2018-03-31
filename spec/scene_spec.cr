require "./spec_helper"
include Flatn

describe Scene do

  it "renders a sphere" do 
    width = 600
    height = 600

    scene = Scene.new
    scene.camera.perspective(1.5, 1.5, 1.0, 5.0)
      .translate(0.0, 0.0, 2.5)
      .rotate_x(-45.0)

    scene.models << STLLoader.new.from_file("spec/input/sphere.stl")

    scene.renderers << SVGRenderer.new(width, height)

    scene.filters << FlatFilter.new(FillStyle.new("#00ffff"))
    scene.filters << WireframeFilter.new(StrokeStyle.new("#000000", width=0.5))
    
    scene.render "spec/output/sphere_flat_wireframe"
  end

  it "renders a bottle" do 
    width = 600
    height = 600

    scene = Scene.new
    scene.camera.perspective(10.0, 10.0, 10.0, 200.0)
      .translate(0.0, -45.0, 110.0)
      # .rotate_x(-45.0)

    scene.models << STLLoader.new.from_file("spec/input/bottle.stl")

    scene.renderers << SVGRenderer.new(width, height)

    scene.filters << FlatFilter.new(FillStyle.new("#00ffff"))
    scene.filters << WireframeFilter.new(StrokeStyle.new("#000000", width=0.5))
    
    scene.render "spec/output/bottle_flat_wireframe"
  end


end
