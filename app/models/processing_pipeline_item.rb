class ProcessingPipelineItem < ApplicationRecord
  belongs_to :processing_pipeline
  belongs_to :pipeline_item
  has_one :pipeline_item_file

  scope :by_position, -> { order(:position) }

end
