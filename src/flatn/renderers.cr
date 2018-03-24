
module Flatn

  # provides an interface for rendering models to 2D outputs
  abstract class Renderer
    
    def initialize(@width : Int32, @height : Int32)
      @size = Vec2.new @width.to_f, @height.to_f
    end

    def ndc_to_screen(p : Vec2)
      (p/2.0 + 0.5) * @size
    end

    abstract def facet(facet : FlatFacet, stroke : StrokeStyle? = nil, fill : FillStyle? = nil)

    abstract def save(path : String)

  end


  # Renderer implementation that writes to an SVG file
  class SVGRenderer < Renderer

    def initialize(width, height)
      super
      @doc = SVGDocument.new
      @doc.width = @width.to_f
      @doc.height = @height.to_f
    end

    def facet(facet : FlatFacet, stroke : StrokeStyle? = nil, fill : FillStyle? = nil)
      @doc.polygon do |poly|
        poly.points = facet.vertices.map{|p| ndc_to_screen(p)}
        stroke.set_svg poly if stroke
        fill.set_svg poly if fill
      end
    end

    def save(path)
      @doc.save path
    end

  end

end