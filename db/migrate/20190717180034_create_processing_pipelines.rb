class CreateProcessingPipelines < ActiveRecord::Migration[6.0]
  def change
    create_table :processing_pipelines do |t|
      t.string :name
      t.timestamps
    end
  end
end
