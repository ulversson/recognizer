class AddStatusToUploadedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :uploaded_items, :status, :string, default: "ready"
  end
end
