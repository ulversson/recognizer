class UploadedItem < ApplicationRecord
  has_one_attached :file
  before_create :save_content_type
  belongs_to :processing_pipeline, optional: true
  belongs_to :medico_legal_case, optional: true
  has_many :processing_result_files, dependent: :destroy
  has_many :processing_result_dates, dependent: :destroy
  
  def file_on_disk
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end

  def file_type
    self.file_content_type.to_s.split("/").last
  end  

  def downloaded_file_path
    File.join '/tmp/', file.filename.to_s
  end  

  def download_file!
    File.open(downloaded_file_path, 'wb') do |f|
      f.write(file.blob.download)
    end
  end  

  private

  def save_content_type
    self.file_content_type =  self.file.content_type.to_s
  end  
end    