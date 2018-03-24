module Flatn

  # Converts a Model to a FlatModel using a camera
  class Flatner

    getter camera

    def initialize(@camera : Camera)
    end

    # Returns a FlatModel by projecting the given model through the camera.
    # The FlatModel will have vertices in NDC space (-1 to 1)
    def flatn(model : Model)
      flat_facets = [] of FlatFacet

      model.facets.each do |facet|
        normal4 = Vec4.new facet.normal.x, facet.normal.y, facet.normal.z, 1.0
        flat_normal = camera.eye_to_ndc(normal4)
        if flat_normal.z < 2.5
          next
        end
        flat_verts = facet.vertices.map do |vert|
          vert4 = Vec4.new vert.x, vert.y, vert.z, 1.0
          vert3 = camera.eye_to_ndc vert4
          Vec2.new vert3.x, vert3.y
        end
        flat_facets << FlatFacet.new(flat_verts)
      end

      FlatModel.new flat_facets
    end

  end

end