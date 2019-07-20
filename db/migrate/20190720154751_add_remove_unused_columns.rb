class AddRemoveUnusedColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :uploaded_items, :name, :string
    remove_column :uploaded_items, :description, :text
    add_column :uploaded_items, :file_content_type, :string
  end
end
