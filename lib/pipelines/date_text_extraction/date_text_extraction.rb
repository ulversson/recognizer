require_relative 'regular_expressions'
input_file = ARGV[0]+".txt"

class DateExtractor

  attr_reader :line_of_text

  def initialize(line_of_text)
    @line_of_text = line_of_text
  end  

  def extract!
    if has_date?
      RegularExpressions.universal_date.match(line_of_text).to_s
    else
      ""
    end    
  end  

  def has_date?
    RegularExpressions.universal_date.match(self.line_of_text)
  end  

end    

matched_lines_with_dates = []
File.readlines(input_file, encoding: 'UTF-8').each do |line|
  line = line.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  date_extractor = DateExtractor.new(line)
  matched_lines_with_dates << date_extractor.extract! if date_extractor.has_date?
end  
pp matched_lines_with_dates