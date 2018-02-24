module Flatn

  class IOMatch

    getter line, data, line_number

    def initialize(@line : String, @data : Regex::MatchData, @line_number : Int32)
      
    end

  end

  # Wraps an IO object and provides some helper methods for parsing
  class IOParser

    getter line_number

    def initialize(@io : IO)
      @line_number = 0
    end

    # returns the next line
    def next_line
      line = @io.gets
      if line.nil?
        return nil
      end
      @line_number += 1
      line
    end

    # steps through lines until it finds one that matches the regex
    # returns an IOMatch containing the line and match data if a match is found, 
    # otherwise raises an exception
    def match_line(regex)
      line = next_line
      while line
        match_data = regex.match(line)
        unless match_data.nil?
          return IOMatch.new(line, match_data, line_number)
        end
        line = next_line
      end
      raise "EOF: Expected #{regex}"
    end

    # like match_line, but returns nil instead of raising an exception when no match is found
    def match_line?(regex)
      line = next_line
      while line
        match_data = regex.match(line)
        unless match_data.nil?
          return IOMatch.new(line, match_data, line_number)
        end
        line = next_line
      end
      nil
    end

    # like match_line, but raises an exception if the match doesn't happen on the next line
    def match_next_line(regex)
      line = next_line
      if line.nil?
        raise "EOF: Expected #{regex} on line #{@line_number}"
      end
      match_data = regex.match(line)
      if match_data.nil?
        raise "Expected #{regex} on line #{@line_number}, found: #{line}"
      end
      return IOMatch.new(line, match_data, line_number)
    end


  end


end