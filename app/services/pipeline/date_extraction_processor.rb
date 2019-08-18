require_relative '../../../lib/pipelines/date_text_extraction/date_extractor'
module Pipeline
  class DateExtractionProcessor

    attr_reader :processing_result_file

    def initialize(processing_result_file)  
      @processing_result_file =  processing_result_file
    end  

    def call
      matched_lines_with_dates = []
      File.readlines(processing_result_file.file_on_disk, encoding: 'UTF-8').each do |line|
        line = line.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
        date_extractor = DateExtractor.new(line)
        if date_extractor.found_date?
          matched_lines_with_dates << date_extractor.extract! 
        end  
      end  
      matched_lines_with_dates
    end  

  end  
end  
