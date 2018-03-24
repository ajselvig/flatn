module Flatn

  # An interface for classes that convert a FlatModel into Renderer instructions
  abstract class Filter

    abstract def render_facet(facet : FlatFacet, renderer : Renderer)

  end


  # Renders every facet with the given stroke style
  class WireframeFilter < Filter

    def initialize(@style : StrokeStyle)
    end

    def render_facet(facet : FlatFacet, renderer : Renderer)
      renderer.facet facet, stroke=@style
    end

  end


  # Renders every facet with the same fill color (i.e. no lighting)
  class FlatFilter < Filter

    def initialize(@style : FillStyle)
    end

    def render_facet(facet : FlatFacet, renderer : Renderer)
      renderer.facet facet, stroke=nil, fill=@style
    end

  end

end