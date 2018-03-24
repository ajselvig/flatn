module Flatn

  # converts a Model to a FlatModel using a camera
  class Flatner

    getter camera

    def initialize(@width : Int32, @height : Int32, @camera : Camera)
      @size = Vec2.new @width.to_f, @height.to_f
    end

    def flatn(model : Model)
      flat_facets = [] of FlatFacet

      model.facets.each do |facet|
        flat_verts = facet.vertices.map do |vert|
          vert4 = Vec4.new vert.x, vert.y, vert.z, 1.0
          vert3 = camera.eye_to_ndc vert4
          # puts vert3.to_s
          vert2 = Vec2.new vert3.x, vert3.y
          (vert2/2.0 + 0.5) * @size
        end
        flat_facets << FlatFacet.new(flat_verts)
      end

      FlatModel.new flat_facets
    end

  end

end