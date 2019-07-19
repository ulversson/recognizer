class RenameProcessingPipelineItemOrderToPosition < ActiveRecord::Migration[6.0]
  def change
    rename_column :processing_pipeline_items, :order, :position
  end
end
