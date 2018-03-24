module Flatn

  # an interface for classes that convert a FlatModel into Renderer instructions
  abstract class Filter

    abstract def render_facet(facet : FlatFacet, renderer : Renderer)

  end


  # renders every facet with the given stroke style
  class WireframeFilter < Filter

    def initialize(@style : StrokeStyle)
    end

    def render_facet(facet : FlatFacet, renderer : Renderer)
      renderer.facet facet, stroke=@style
    end

  end

end