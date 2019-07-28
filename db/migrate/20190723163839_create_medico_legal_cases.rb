class CreateMedicoLegalCases < ActiveRecord::Migration[6.0]
  def change
    create_table :medico_legal_cases do |t|
      t.string :name
      t.timestamps
    end
  end
end
