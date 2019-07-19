class AddCodeToProcessingPipelines < ActiveRecord::Migration[6.0]
  def change
    add_column :processing_pipelines, :code, :string
  end
end
