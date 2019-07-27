class UploadedItemSerializer
  include FastJsonapi::ObjectSerializer
  extend ActionDispatch::Routing::UrlFor
  extend ActionView::Helpers::UrlHelper
  extend ActionView::Helpers::TagHelper

  set_type :uploaded_item
  attributes :id, :uploaded_at, :file_type, :status, :processing_pipeline_id
  
  attribute :file_link do |object|
    if object.file.attached?
      blob_path = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true, disposition: :attachment)
      link_to(object.file.filename.to_s, blob_path)
    end
  end

  attribute :filename do |object|
    object.file.filename.to_s
  end
  
  attribute :dates do |object|
    object.processing_result_dates.map(&:discovered_date).uniq
  end  

  attribute :files do |object|
    object.processing_result_files.uniq.map do |f| 
      ProcessingResultFileSerializer.new(f).serializable_hash[:data][:attributes]
    end
  end  

  attribute :uploaded_at do |object|
    object.file.created_at.strftime("%d/%M/%Y %H:%M") if object.file.attached?
  end    
end
  