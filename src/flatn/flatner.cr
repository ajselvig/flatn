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

      rotation = @camera.transform.rotation 

      model.facets.each do |facet|
        # rotate the normal to the same orientation as the camera and 
        # reject anything that's facing away from it
        normal4 = facet.normal.to_vec4
        normal_t = rotation * normal4
        if normal_t.z >= 0
          next
        end

        # flatten the vertices
        flat_verts = facet.vertices.map do |vert|
          vert3 = camera.eye_to_ndc vert.to_vec4
          Vec2.new vert3.x, vert3.y
        end

        # compute the depth from the camera
        center = facet.center
        center_t = rotation * center.to_vec4
        depth = center_t.z

        flat_facets << facet.make_flat(flat_verts, depth)
      end

      flat_facets = flat_facets.sort_by(&.depth).reverse

      FlatModel.new flat_facets
    end

  end

end