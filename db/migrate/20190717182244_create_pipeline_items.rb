class CreatePipelineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :pipeline_items do |t|
      t.string :name, :arguments, :path, :command 
      t.timestamps
    end
  end
end
