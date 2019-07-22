class UploadedItem < ApplicationRecord
  has_one_attached :file
  before_create :save_content_type
  belongs_to :processing_pipeline, optional: true

  def file_on_disk
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end

  def file_type
    self.file_content_type.to_s.split("/").last
  end  

  private

  def save_content_type
    self.file_content_type =  self.file.content_type.to_s
  end  
end    