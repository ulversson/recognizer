module Services
  module Pipeline
    module Processor

      def self.run(uploaded_item)
        uploaded_item.download_file!
        processing_result = process_pipeline(uploaded_item)
        save_result_files(uploaded_item)
        save_dates(uploaded_item, processing_result)    
        uploaded_item.update_column :status, "processed"          
      end 
      
      def self.process_pipeline(uploaded_item)
        uploaded_item.processing_pipeline
                     .processing_pipeline_items
                     .order(:position).map do |item|
            path = uploaded_item.downloaded_file_path
            item.pipeline_item.run(path, path)
         end  
      end   

      def self.save_result_files(uploaded_item)
        [uploaded_item.downloaded_file_path, uploaded_item.downloaded_file_path+".txt"].each do |result_file|
          processing_result = ProcessingResultFile.new(uploaded_item_id: uploaded_item.id)
          content_type = result_file.match("txt") ? 'text/plain' : uploaded_item.file_content_type
          processing_result.file.attach io: File.open(result_file), 
                                        filename: uploaded_item.file.filename.to_s, 
                                        content_type: content_type
          processing_result.save(validate: false)
        end
      end 

      def self.save_dates(uploaded_item, processing_result)
        dates = processing_result[-1].split(",")
                                     .map {|str_date| Date.parse(str_date)}
                                     .uniq  
        dates.each do |dt| 
          ProcessingResultDate.create! uploaded_item_id: uploaded_item.id,
                                        discovered_date: dt

        end        
      end  

    end  
  end
end    