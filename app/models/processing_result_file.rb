require 'pipeline/multi_page_processor'
require 'pipeline/file_helper'
class ProcessingResultFile < ApplicationRecord
  has_one_attached :file
  belongs_to :uploaded_item
  has_many :processing_result_dates
  extend Pipeline::FileHelper

  def file_on_disk
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end

  def first_date
    processing_result_dates.order(:discovered_date).first
  end  

  def all_dates
    processing_result_dates.order(:discovered_date).map(&:discovered_date)
  end  

  def all_but_first_date
    all_dates - [first_date]
  end  

  def name
    "#{File.basename(file.filename.to_s)} - #{uploaded_item.file.filename.to_s}"
  end  

  def image_file_id
    UploadedItems::ImageFileFinder.new(uploaded_item, self.file.filename.to_s).call
  end
  
  class << self

    def search_name(search)
      with_attached_file.
        references(:file_attachment).
        where(ActiveStorage::Blob.arel_table[:filename].matches("%#{search}%"))
    end

    def from_uploaded_item(uploaded_item, file_to_attach, content_type)
      file_name = content_type =~ /image/ ? 
        File.basename(file_to_attach) : text_file(file_to_attach)
      processing_result = ProcessingResultFile.new(uploaded_item_id: uploaded_item.id)
      processing_result.file.attach io: File.open(file_to_attach), 
                                    filename: file_name, 
                                    content_type: content_type
      processing_result.save(validate: false)
      processing_result
    end  

  end  
end  