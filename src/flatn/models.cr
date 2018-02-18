
module Flatn

  # A Facet is a single triangle with three vertices and a normal vector
  class Facet

    @vertices : Array(Vec3)
    @normal : Vec3

    getter normal, vertices

    def initialize(verts : Array(Vec3), norm : Vec3)
      unless verts.size == 3
        raise "vertices must have exactly 3 elements"
      end
      @vertices = verts.map &.normalize
      @normal = norm.normalize
    end

  end

  # A Model represents a 3D object as a set of Facets
  class Model

    getter name, facets

    def initialize(@name : String)
      @facets = [] of Facet
    end

  end


end

