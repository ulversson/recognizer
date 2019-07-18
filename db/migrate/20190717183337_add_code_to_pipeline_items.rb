class AddCodeToPipelineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :pipeline_items, :code, :string
    add_column :pipeline_items, :result, :text
  end
end
