class PipelineItem < ApplicationRecord
  belongs_to :processing_pipeline
  belongs_to :processing_pipeline_item

  def run(input_path, output_path)
    `#{command} #{path} #{arguments.gsub("[input]", input_path)} #{output_path}`.strip
  end  
end    