class ChangeStatusToBePendingInUploadedItems < ActiveRecord::Migration[6.0]
  def change
    change_column :uploaded_items, :status,  :string ,null: false, default: "pending"
  end
end
