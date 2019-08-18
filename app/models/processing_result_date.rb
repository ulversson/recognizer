class ProcessingResultDate < ApplicationRecord
  belongs_to :uploaded_item
  belongs_to :processing_result_file, optional: true
end   