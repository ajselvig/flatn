module Flatn

  # an interface for classes that convert a FlatModel into Renderer instructions
  abstract class Filter

    def initialize(@model : FlatModel)
    end

    abstract def render(renderer : Renderer)

  end


  # renders every facet with the given stroke style
  class WireframeFilter < Filter

    def initialize(model, @style : StrokeStyle)
      super model
    end

    def render(renderer : Renderer)
      @model.facets.each do |facet|
        renderer.facet facet, stroke=@style
      end
    end

  end

end