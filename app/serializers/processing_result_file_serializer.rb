class ProcessingResultFileSerializer
  include FastJsonapi::ObjectSerializer
  extend ActionDispatch::Routing::UrlFor
  extend ActionView::Helpers::UrlHelper
  extend ActionView::Helpers::TagHelper

  set_type :processing_result_file
  attributes :id
  
  attribute :content_type do |object|
    object.file.content_type
  end  
  
  attribute :dates do |object|
    object.processing_result_dates.map(&:discovered_date).uniq
  end  

  attribute :src do |object|
    image_file = ProcessingResultFile.where(id: object.image_file_id).first
    return "" if image_file.blank?
    Rails.application
          .routes
          .url_helpers
          .rails_blob_path(image_file.file, only_path: true, disposition: :inline)
  end  

  attribute :text_file do |object|
    Rails.application
    .routes
    .url_helpers
    .rails_blob_path(object.file, only_path: true, disposition: :inline)
  end  

  attribute :file_link do |object|
    if object.file.attached?
      blob_path = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true, disposition: :attachment)
      link_to(object.file.filename.to_s, blob_path)
    end
  end

  attribute :filename do |object|
    object.file.filename.to_s
  end  

  attribute :h do |o| 
    800 
  end    
  attribute :w do |o| 
    600 
  end  
end
