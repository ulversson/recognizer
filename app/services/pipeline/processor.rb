module Services
  module Pipeline
    module Processor

      def self.run(processing_pipeline, file_path)
        processing_pipeline.processing_pipeline_items
                           .order(:position).map do |item|
          item.pipeline_item.run(file_path, file_path)
        end                    
      end  

    end  
  end
end    