class ProcessingResultsController < ApplicationController

  def show
    @uploaded_item = UploadedItem.find(params[:id])
    render json: {
      filename: @uploaded_item.file.filename.to_s,
      id: @uploaded_item.id,
      dates: @uploaded_item.processing_result_dates.map(&:discovered_date).uniq,
      files: (@uploaded_item.processing_result_files.uniq.map do |f| 
        Hash[
          src: Rails.application.routes.url_helpers.rails_blob_path(f.file, only_path: true, disposition: :inline),
          filename: f.file.filename.to_s,
          h: 800,
          w: 600,
          id: f.id,
          content_type: f.file.content_type
        ]
      end)
    }
  end
    
end    