class ProcessingResultFile < ApplicationRecord
  has_one_attached :file
  belongs_to :uploaded_item
  def file_on_disk
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end
end   