class AddMultipageToProcessingPipelines < ActiveRecord::Migration[6.0]
  def change
    add_column :processing_pipelines, :multipage, :boolean, default: false
  end
end
