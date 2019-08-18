class MedicoLegalCase < ApplicationRecord
  has_many :uploaded_items, dependent: :destroy
  has_many :processing_result_files
  has_many :processing_result_dates, through: :processing_result_files
end
