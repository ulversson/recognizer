module ApplicationHelper
  def uploaded_image_path(image)
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true, disposition: :attachment)
  end  

  def text_file(image)
    image.filename.to_s.gsub('.png','')+".txt"
  end
end
