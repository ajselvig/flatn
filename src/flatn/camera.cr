module Flatn

  # http://www.songho.ca/opengl/gl_projectionmatrix.html

  class Camera

    getter transform, projection

    def initialize()
      @projection = Mat4.unit
      @transform = Mat4.unit
      @matrix = Mat4.unit
    end

    def init_perspective(width : Float64, height : Float64, near : Float64, far : Float64)
      r = width / 2.0
      t = height / 2.0
      @projection = Mat4.new(
        near/r, 0.0, 0.0, 0.0,
        0.0, near/t, 0.0, 0.0,
        0.0, 0.0, -(far+near)/(far-near), -2.0*near*far/(far-near),
        0.0, 0.0, -1.0, 0.0
      )
      self.update_matrix
      self
    end

    def update_matrix
      @matrix = @projection * @transform
    end

    def translate(vec : Vec3)
      @transform = @transform.translate vec
      self.update_matrix
      self
    end

    def translate(x, y, z)
      translate Vec3.new(x, y, z)
    end

    def rotate_x(deg : Float64)
      @transform = @transform.rotate_x deg
      self.update_matrix
      self
    end

    def rotate_y(deg : Float64)
      @transform = @transform.rotate_y deg
      self.update_matrix
      self
    end

    def eye_to_clip(eye : Vec4)
      @matrix * eye
    end

    def eye_to_ndc(eye : Vec4)
      self.eye_to_clip(eye).to_vec3
    end

  end

end