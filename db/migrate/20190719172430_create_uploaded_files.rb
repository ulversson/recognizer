class CreateUploadedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaded_items do |t|
      t.string :name
      t.text :description
      t.integer :medico_legal_case_id
    end
  end
end
