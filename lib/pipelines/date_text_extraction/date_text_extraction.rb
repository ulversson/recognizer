require_relative 'regular_expressions'
input_file = ARGV[0]

class DateExtractor

  attr_reader :line_of_text

  def initialize(line_of_text)
    @line_of_text = line_of_text
  end  

  def extract!
    require 'pry'
    if has_date? 
      RegularExpressions.universal_date.match(line_of_text).to_s
    elsif has_short_date?
      RegularExpressions.short_date.match(line_of_text).to_s
    elsif has_month_short_date?
      RegularExpressions.month_short.match(self.line_of_text)
    elsif has_month_long_date?  
      RegularExpressions.month_long.match(self.line_of_text)
    else  
      ""
    end    
  end  

  def found_date?
    has_date? || has_short_date? || has_month_long_date? || has_month_short_date?
  end  

  def has_date?
    RegularExpressions.universal_date.match(self.line_of_text)
  end  

  def has_short_date?
    RegularExpressions.short_date.match(self.line_of_text)
  end
  
  def has_month_short_date?
    RegularExpressions.month_short.match(self.line_of_text)
  end 
  
  def has_month_long_date?
    RegularExpressions.month_long.match(self.line_of_text)
  end  
end    



def extract_dates(input_file)
  matched_lines_with_dates = []
  File.readlines(input_file, encoding: 'UTF-8').each do |line|
    line = line.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
    date_extractor = DateExtractor.new(line)
    matched_lines_with_dates << date_extractor.extract! if date_extractor.found_date?
  end  
  pp matched_lines_with_dates.compact.join(",")
end

if File.directory? input_file 
  files = Dir.glob("#{input_file}/*.txt").map(&File.method(:realpath))
  files.each do |file|
    extract_dates(file)
  end  
else
  extract_dates(input_file)
end  
exit(0)
