require 'application_base_service'
module Services
  module UploadedItems 
    class TextFileFinder < ApplicationBaseService

      attr_reader :uploaded_item, :file_name

      def initialize(uploaded_item, file_name)
        @uploaded_item = uploaded_item
        @file_name = file_name
      end  

      def call
        items = uploaded_item.processing_result_files.map do |file| 
          [file.id, file.file.content_type, file.file.filename.to_s]
        end  
        items.select {|i| i[1] == "text/plain" && i[2] == file_name}.first.first rescue nil
      end  

    end
  end
end