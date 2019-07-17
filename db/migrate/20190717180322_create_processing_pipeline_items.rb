class CreateProcessingPipelineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :processing_pipeline_items do |t|
      t.integer :processing_pipeline_id, :order
      t.string :command, :arguments, :name
      t.timestamps
    end
  end
end
