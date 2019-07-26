class CreateUploadedItemDates < ActiveRecord::Migration[6.0]
  def change
    create_table :processing_result_dates do |t|
      t.datetime :discovered_date
      t.integer :uploaded_item_id
    end
  end
end
