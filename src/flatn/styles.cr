module Flatn

  class FillStyle

    property color : String

    def initialize(@color)
    end

    def set_svg(node : SVGDrawableNode)
      node.fill = self.color
    end

  end

  class StrokeStyle

    property color : String

    property width : Float64 = 1.0

    def initialize(@color, @width = 1.0)
    end

    def set_svg(node : SVGDrawableNode)
      node.stroke = self.color
      node.stroke_width = self.width
    end

  end

end