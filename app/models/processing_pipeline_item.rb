class ProcessingPipelineItem < ApplicationRecord
  belongs_to :processing_pipeline
  belongs_to :pipeline_item
end