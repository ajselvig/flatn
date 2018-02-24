module Flatn

  # Loads an STL file into a Model
  class STLLoader

    def initialize()
    
    end

    def from_file(path)
      File.open path, "r" do |file|
        parse IOParser.new(file)
      end
    end

    FACET_REGEX = /facet\s+/

    def parse(io)
      match = io.match_line /s*solid\s+\w+/
      name = match.data[0].split(/\s+/).last.strip
      model = Model.new name

      facet_match = io.match_line? FACET_REGEX
      while facet_match
        model.facets << parse_facet(io, facet_match.line)
        facet_match = io.match_line? FACET_REGEX
      end
      model
    end

    private def parse_facet(io, facet_line)
      normal = parse_vector facet_line
      v1 = parse_vector io.match_line(/vertex/).line
      v2 = parse_vector io.match_next_line(/vertex/).line
      v3 = parse_vector io.match_next_line(/vertex/).line
      Facet.new([v1, v2, v3], normal)
    end

    # parses a Vector3 from the end of the line
    def parse_vector(line)
      comps = line.split(/\s+/)
      unless comps.size > 2
        raise "line must contain at least 3 components to be parsed into a vector, but it has #{comps.size}: #{line}"
      end
      comps_f = comps[-3..-1].map(&.to_f)
      Vec3.new comps_f
    end

  end


end
