require "./spec_helper"
include Flatn

def parse_string(s)
  IOParser.new IO::Memory.new(s)
end

def multiline_parser
  parse_string(
    "line one
    line two
    line three"
  )
end

describe "IO" do 

  describe "parser" do 
    
    it "matches a line" do 
      match = multiline_parser.match_line(/two/)
      match.line_number.should eq(2)
      match.data[0].should eq("two")
    end

    it "raises when match not found" do 
      expect_raises Exception do 
        multiline_parser.match_line(/four/)
      end
    end

    it "matches the next line" do 
      parser = multiline_parser
      parser.next_line
      parser.match_next_line(/two/).line_number.should eq(2)
    end

  end


end
