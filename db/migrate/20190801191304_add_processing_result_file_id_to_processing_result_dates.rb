class AddProcessingResultFileIdToProcessingResultDates < ActiveRecord::Migration[6.0]
  def change
    add_column :processing_result_dates, :processing_result_file_id, :integer
  end
end
