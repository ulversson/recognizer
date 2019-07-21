class AddProcessingPipelineIdToUploadedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :uploaded_items, :processing_pipeline_id, :integer
  end
end
