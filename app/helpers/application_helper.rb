require 'uploaded_items/image_file_finder'
module ApplicationHelper

  include UploadedItems

  def uploaded_image_path(image)
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true, disposition: :attachment)
  end  

  def text_file(image)
    image.filename.to_s.gsub('.png','')+".txt"
  end

  def uploaded_image_path_from_text(text_file)
    file_finder = ImageFileFinder.new(text_file.uploaded_item, text_file.file.filename)
    file_id = file_finder.call
    if file_id
      processed_file = ProcessingResultFile.find(file_id)
      Rails.application.routes.url_helpers.rails_blob_path(processed_file.file, only_path: true, disposition: :attachment)
    end  
  end  

end
