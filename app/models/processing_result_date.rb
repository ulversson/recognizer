class ProcessingResultDate < ApplicationRecord
  default_scope -> { where(date_skipped: false) }
  belongs_to :uploaded_item
  belongs_to :processing_result_file, optional: true
  before_save :set_skipped
  SKIP_DATE = Time.now - 30.years

  def skipped?
    self.discovered_date < SKIP_DATE rescue false
  end  

  private

  def set_skipped
    self.date_skipped = self.skipped? 
  end  

end   