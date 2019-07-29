module Services
  module Pipeline
    module MultiPageProcessor

      def self.run(uploaded_item)
        uploaded_item.download_file!
        output_dir = process_pipeline(uploaded_item)
        save_result_files(uploaded_item, output_dir)
        save_dates(uploaded_item, processing_result)    
        uploaded_item.update_column :status, "processed"          
      end 

      def self.basename(uploaded_item)
        filename = uploaded_item.file.filename.to_s
        File.basename filename, File.extname(filename)
      end  
      
      def self.process_pipeline(uploaded_item)
        output_dir == "/tmp/#{basename(uploaded_item)}"
        uploaded_item.processing_pipeline
                     .processing_pipeline_items
                     .order(:position).each_with_index do |item, index|
            if (index == 0)
              FileUtils.mkdir_p output_dir
              item.run(uploaded_item.file_on_disk, output_dir)
            else
              item.run(output_dir, "")
            end    
         end  
         return output_dir
      end   

      def self.save_result_files(uploaded_item, output_dir)
        files = Dir.glob("#{output_dir}/*.png").map(&File.method(:realpath))
        files.each do |file|
          processing_result = ProcessingResultFile.new(uploaded_item_id: uploaded_item.id)
          processing_result.file.attach io: File.open(file), 
                                        filename: File.basename(file), 
                                        content_type: "image/png"
          processing_result.save(validate: false)
        end  
        files = Dir.glob("#{output_dir}/*.txt").map(&File.method(:realpath))
        files.each do |file|
          processing_result = ProcessingResultFile.new(uploaded_item_id: uploaded_item.id)
          processing_result.file.attach io: File.open(file), 
                                        filename: File.basename(file), 
                                        content_type: "text/plain"
          processing_result.save(validate: false)
      end 

      def self.save_dates(uploaded_item, processing_result)
        dates = processing_result[-1].split(",")
                                     .map {|str_date| Date.parse(str_date) rescue nil}
                                     .uniq.compact  
        dates.each do |dt| 
          ProcessingResultDate.create! uploaded_item_id: uploaded_item.id,
                                        discovered_date: dt

        end        
      end  

    end  
  end
end    