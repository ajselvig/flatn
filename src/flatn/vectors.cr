
module Flatn

  struct Vec2
    getter x, y
  
    def initialize(@x : Float64, @y : Float64)
    end
  
    def +(other)
      Vec2.new(x + other.x, y + other.y)
    end
  
    def -(other)
      Vec2.new(x - other.x, y - other.y)
    end

    def *(scalar)
      Vec2.new(x*scalar, y*scalar)
    end

    def /(scalar)
      Vec2.new(x/scalar, y/scalar)
    end

  end

  struct Vec3
    getter x, y, z
  
    def initialize(@x : Float64, @y : Float64, @z : Float64)
    end
  
    def +(other)
      Vec3.new(x + other.x, y + other.y, z + other.z)
    end
  
    def -(other)
      Vec3.new(x - other.x, y - other.y, z - other.z)
    end

    def *(scalar)
      Vec3.new(x*scalar, y*scalar, z*scalar)
    end

    def /(scalar)
      Vec3.new(x/scalar, y/scalar, z/scalar)
    end

    def mag
      Math.sqrt(x*x + y*y + z*z)
    end

    def normalize
      m = mag
      Vec3.new(x / m, y / m, z / m)
    end

    def self.unit
      Vec3.new(1.0, 1.0, 1.0)
    end

    def self.x_unit
      Vec3.new(1.0, 0.0, 0.0)
    end

  end
    
end