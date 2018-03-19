require "./spec_helper"
include Flatn

describe "SVG" do 

  it "assigns attributes" do 
    rect = SVGRectNode.new
    rect.x = 4.0
    rect.x.should eq(4.0)
  end

  it "makes a document" do 
    doc = SVGDocument.new
    doc.width = 400
    doc.height = 400
    group = doc.group

    rect = group.rect do |rect|
      rect.x = 4.0
      rect.y = 4.0
      rect.rx = 20.0
      rect.ry = 20.0
      rect.width = 100.0
      rect.height = 50.0
      rect.fill = "#00FF00"
      rect.stroke = "#0000FF"
      rect.stroke_width = 2
    end
    rect.x.should eq(4.0)

    group.polygon do |path|
      path.points = [Vec2.new(45.0, 55.0), Vec2.new(105.0, 20.0), Vec2.new(155.0, 100.0)]
      path.fill = "#FF0000"
    end

    doc.save "spec/output/svg_spec.svg"
    doc_s = doc.to_s

    doc_s.should contain("<svg")
    doc_s.should contain("x=\"4.0\"")
  
  end

end

