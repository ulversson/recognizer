class ProcessingPipeline < ApplicationRecord
  has_many :processing_pipeline_items
  has_many :pipeline_items, through: :processing_pipeline_items
  has_many :uploaded_items
end
