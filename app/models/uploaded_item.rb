class UploadedItem < ApplicationRecord
  has_one_attached :file
end    