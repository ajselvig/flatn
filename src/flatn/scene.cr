module Flatn

  # A Scene contains one or more models, filters, and renderers
  class Scene

    getter camera, filters, renderers, models

    def initialize
      @camera = Camera.new
      @flatner = Flatner.new @camera

      @filters = [] of Filter
      @renderers = [] of Renderer
      @models = [] of Model

    end

    def render(path)
      unless @filters.size > 0
        raise "Must have at least one filter in a scene!"
      end
      unless @renderers.size > 0
        raise "Must have at least one renderer in a scene!"
      end
      unless @models.size > 0
        raise "Must have at least one model in a scene!"
      end
      @models.each do |model|
        flat_model = @flatner.flatn model
        @filters.each do |filter|
          @renderers.each do |renderer|
            flat_model.facets.each do |facet|
              filter.render_facet facet, renderer
            end
          end
        end
      end

      @renderers.each do |renderer|
        renderer.save path
      end
    end


  end

end