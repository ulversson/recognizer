class ProcessingResultsController < ApplicationController

  def show
    @uploaded_item = UploadedItem.find(params[:id])
    render json: {
      filename: @uploaded_item.file.filename.to_s,
      id: @uploaded_item.id,
      dates: @uploaded_item.processing_result_dates.map(&:discovered_date).uniq,
      files: (@uploaded_item.processing_result_files.uniq.map do |f| 
        ProcessingResultFileSerializer.new(f).serializable_hash[:data][:attributes]
      end)
    }
  end
    
end    