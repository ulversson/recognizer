require_relative 'regular_expressions'

class DateExtractor

  attr_reader :line_of_text

  def initialize(line_of_text)
    @line_of_text = line_of_text
  end  

  def extract!
    if has_date? 
      RegularExpressions.universal_date.match(line_of_text).to_s
    elsif has_short_date?
      RegularExpressions.short_date.match(line_of_text).to_s
    elsif has_month_short_date?
      RegularExpressions.month_short.match(self.line_of_text).to_s
    elsif has_month_long_date?  
      RegularExpressions.month_long.match(self.line_of_text).to_s
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
