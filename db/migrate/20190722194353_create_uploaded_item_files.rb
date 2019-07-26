class CreateUploadedItemFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :processing_result_files do |t|
      t.integer :uploaded_item_id
      t.timestamps
    end
  end
end
