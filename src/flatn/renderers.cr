require "stumpy_png"
require "stumpy_utils"

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
      unless path =~ /\.svg$/
        path = path + ".svg"
      end
      @doc.save path
    end

  end


  # Renderer implementation that writes to a raster image file
  class PNGRenderer < Renderer

    def initialize(width, height)
      super

      @canvas = StumpyPNG::Canvas.new(width, height)
    end

    def facet(facet : FlatFacet, stroke : StrokeStyle? = nil, fill : FillStyle? = nil)
      if stroke
        facet.vertices.each_index do |i|
          p1 = ndc_to_screen facet.vertices[i]
          p2 = ndc_to_screen facet.vertices[(i+1)%3]
          @canvas.line p1.x, p1.y, p2.x, p2.y, StumpyPNG::RGBA.from_hex(stroke.color)
        end
      end
    end

    def save(path)
      unless path =~ /\.png$/
        path = path + ".png"
      end
      StumpyPNG.write @canvas, path
    end

  end

end