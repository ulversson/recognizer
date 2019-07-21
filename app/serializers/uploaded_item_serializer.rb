class UploadedItemSerializer
  include FastJsonapi::ObjectSerializer
  extend ActionDispatch::Routing::UrlFor
  extend ActionView::Helpers::UrlHelper
  extend ActionView::Helpers::TagHelper

  set_type :uploaded_item
  attributes :id, :uploaded_at, :file_type, :status
  
  attribute :filename do |object|
    if object.file.attached?
      blob_path = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true, disposition: :attachment)
      link_to(object.file.filename.to_s, blob_path)
    end
  end

  attribute :uploaded_at do |object|
    object.file.created_at.strftime("%d/%M/%Y %H:%M") if object.file.attached?
  end    
end
  