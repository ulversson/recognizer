class AddDateSkippedToProcessingResultDates < ActiveRecord::Migration[6.0]
  def change
    add_column :processing_result_dates, :date_skipped, :boolean, default: false
  end
end
