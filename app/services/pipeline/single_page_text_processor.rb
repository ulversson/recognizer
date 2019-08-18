require 'pipeline/file_helper'
module Pipeline
  class SinglePageTextProcessor

    attr_accessor :uploaded_item
    include Pipeline::FileHelper

    def initialize(uploaded_item)
      @uploaded_item = uploaded_item
    end  

    def call
      uploaded_item.download_file!
      result = process_pipeline
      save_result_files
      save_dates(result)    
      uploaded_item.processed!          
    end 

    def process_pipeline
      uploaded_item.processing_pipeline_items
                   .by_position.map do |item|
        path = uploaded_item.downloaded_file_path
        item.pipeline_item.run(path, path)
      end  
    end  

    def save_result_files
      [uploaded_item.downloaded_file_path, text_file].each do |result_file|
        processing_result = ProcessingResultFile.new(uploaded_item_id: uploaded_item.id)
        processing_result.file.attach io: File.open(result_file), 
                                      filename: filename(result_file), 
                                      content_type: file_content_type(result_file)
        processing_result.save(validate: false)
      end
    end 

    def text_file
      uploaded_item.downloaded_file_path+".txt"
    end  

    def file_content_type(result_file)
      result_file.match("txt") ? 'text/plain' : uploaded_item.file_content_type
    end  

    def filename(result_file)
      result_file.match("txt") ? uploaded_item.file.filename.to_s + ".txt" : uploaded_item.file.filename.to_s
    end  

    def save_dates(processing_result)
      dates = processing_result[-1].split(",")
                                     .map {|str_date| Date.parse(str_date) rescue nil}
                                     .uniq.compact  
        dates.each do |dt| 
          ProcessingResultDate.create! uploaded_item_id: uploaded_item.id,
                                       discovered_date: dt,
                                       processing_result_file_id: uploaded_item.text_file.id

        end        
    end

  end  
end
