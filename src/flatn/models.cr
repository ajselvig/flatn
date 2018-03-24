
module Flatn

  # A Facet is a single triangle with three vertices and a normal vector
  class Facet

    @vertices : Array(Vec3)
    @normal : Vec3

    getter normal, vertices

    def initialize(@vertices : Array(Vec3), norm : Vec3)
      unless @vertices.size == 3
        raise "vertices must have exactly 3 elements"
      end
      @normal = norm.normalize
    end

    def make_flat(verts : Array(Vec2))
      FlatFacet.new self, verts
    end

  end

  # A Model represents a 3D object as a set of Facets
  class Model

    getter name, facets

    def initialize(@name : String)
      @facets = [] of Facet
    end

  end

  # A flat Facet is a single triangle with three 2D vertices
  class FlatFacet

    @vertices : Array(Vec2)

    getter vertices, parent

    def initialize(@parent : Facet, @vertices : Array(Vec2))
      unless @vertices.size == 3
        raise "vertices must have exactly 3 elements"
      end
    end

  end

  class FlatModel

    getter facets

    def initialize(@facets : Array(FlatFacet))
    end

  end

end

