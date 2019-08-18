require 'pipeline/file_helper'
require 'pipeline/date_extraction_processor'

module Pipeline
  class MultiPageProcessor

    include Pipeline::FileHelper
    attr_accessor :uploaded_item, :directory

    def initialize(uploaded_item)
      @uploaded_item = uploaded_item
      @directory = output_dir(uploaded_item)
      FileUtils.mkdir_p directory
    end  

    def call
      uploaded_item.download_file!
      process_pipeline
      save_result_files
      uploaded_item.processed!         
    end 

    def process_pipeline
      uploaded_item.processing_pipeline_items
        .by_position
        .each_with_index do |item, index|
          if (index == 0)
            item.pipeline_item.run uploaded_item.file_on_disk, directory
          else
            item.pipeline_item.run directory, ""
          end    
        end  
      directory
    end  

    def save_result_files
      files_by_extension(uploaded_item, "png").each do |img_file|
          roc_res = ProcessingResultFile.from_uploaded_item(uploaded_item, img_file, "image/png")
      end  
      files_by_extension(uploaded_item, "txt").each do |text_file|
        proc_res = ProcessingResultFile.from_uploaded_item(uploaded_item, text_file, "text/plain")
        save_dates(proc_res)
      end 
    end

    def save_dates(processing_result)
      Pipeline::DateExtractionProcessor.new(processing_result).call.each do |date|
        next if date.blank?
        ProcessingResultDate.create! uploaded_item_id: processing_result.uploaded_item_id,
                                     processing_result_file_id: processing_result.id, 
                                     discovered_date: date
      end  
    end  

  end  
end
