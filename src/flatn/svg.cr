require "xml"

# converts a method name to its equivalent SVG attribute name
def attr_name(s)
  s.gsub("_", "-")
end


module Flatn

  # base class for all SVG nodes
  abstract class SVGNode

    def initialize(@tag : String)
      @attrs = {} of String => String
    end

    protected def build(xml : XML::Builder)
      xml.element @tag, @attrs
    end

    macro string_attr(name)
      def {{name}}
        @attrs[attr_name("{{name}}")].to_s
      end
      def {{name}}=(s)
        @attrs[attr_name("{{name}}")] = s.to_s
      end
    end

    macro float_attr(name)
      def {{name}}
        @attrs[attr_name("{{name}}")].to_f
      end
      def {{name}}=(f)
        @attrs[attr_name("{{name}}")] = f.to_s
      end
    end

  end

  # an SVG node that contains other nodes (root and groups)
  class SVGContainer < SVGNode

    def initialize(tag : String)
      super tag

      @children = [] of SVGNode
    end

    protected def build(xml : XML::Builder)
      xml.element @tag, @attrs do 
        @children.each do |child|
          child.build(xml)
        end
      end
    end

    macro child(name, type)
      def {{name}}
        node = {{type}}.new
        @children << node
        node
      end
      def {{name}}(&block : {{type}} -> _)
        node = {{type}}.new
        @children << node
        yield node
        node
      end
    end

    child group, SVGGroupNode
    child rect, SVGRectNode
    child polygon, SVGPolygonNode

  end

  # a root SVG document
  class SVGDocument < SVGContainer

    def initialize
      super "svg"
      @attrs["xmlns"] = "http://www.w3.org/2000/svg"
    end

    float_attr width
    float_attr height

    def to_s
      XML.build(indent: "  ") do |xml|
        self.build xml
      end
    end

    def save(path)
      File.open(path, "w") do |file|
        file.puts self.to_s
      end
    end

  end

  class SVGGroupNode < SVGContainer
    def initialize
      super "g"
    end
  end

  abstract class SVGDrawableNode < SVGNode

    string_attr fill
    string_attr stroke
    float_attr stroke_width

  end

  class SVGRectNode < SVGDrawableNode

    def initialize
      super "rect"
    end

    float_attr x
    float_attr y
    float_attr width
    float_attr height
    float_attr rx
    float_attr ry

  end

  class SVGPolygonNode < SVGDrawableNode

    def initialize
      super "polygon"
    end

    def points
      (@attrs["points"] || "").split(" ").map do |comp|
        Vec2.parse(comp)
      end
    end

    def points=(p)
      @attrs["points"] = p.map(&.to_s).join(" ")
    end

  end

end

