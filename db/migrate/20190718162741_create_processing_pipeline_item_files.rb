class CreateProcessingPipelineItemFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :processing_pipeline_item_files do |t|
      t.string :input_file_path, :output_file_path, :output_directory
      t.integer :processing_pipeline_item_id
    end
  end
end
