class AddMedicoLegalCaseIdToProcessingResultFiles < ActiveRecord::Migration[6.0]
  def change
    add_column :processing_result_files, :medico_legal_case_id, :integer
  end
end
