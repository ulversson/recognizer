class ProcessingPipeline < ApplicationRecord
  has_many :processing_pipeline_items, through: :pipeline_items
  has_many :pipeline_items
end
