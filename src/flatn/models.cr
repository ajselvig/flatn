
module Flatn

  # A Model represents a 3D object as a set of Facets
  class Model

    getter name, facets

    def initialize(@name : String)
      @facets = [] of Facet
    end

  end

  # A Facet is a single triangle with three vertices and a normal vector
  class Facet

    getter normal, vertices

    def initialize(@vertices : Array(Vec3), @normal : Vec3)
      unless @vertices.size == 3
        raise "vertices must have exactly 3 elements"
      end
    end


  end


end

