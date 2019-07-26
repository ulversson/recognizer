class MedicoLegalCase < ApplicationRecord
  has_many :uploaded_items, dependent: :destroy
  has_many :processing_result_dates, through: :uploaded_items
  has_many :processing_result_files, through: :uploaded_items
end
