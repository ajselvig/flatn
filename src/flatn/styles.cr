module Flatn

  class FillStyle

    property color

    def constructor(@color)
    end

  end

  class StrokeStyle

    property color

    property width : Float64 = 1.0

    def constructor(@color, @width = 1.0)
    end

  end

end