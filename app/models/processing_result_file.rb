class ProcessingResultFile < ApplicationRecord
  has_one_attached :file
  belongs_to :uploaded_item
end   