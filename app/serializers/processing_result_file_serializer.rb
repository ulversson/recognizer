class ProcessingResultFileSerializer
  include FastJsonapi::ObjectSerializer
  set_type :processing_result_file
  attributes :id
  
  attribute :content_type do |object|
    object.file.content_type
  end  

  attribute :src do |object|
    Rails.application
          .routes
          .url_helpers
          .rails_blob_path(object.file, only_path: true, disposition: :inline)
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
