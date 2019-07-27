class ProcessingResultsController < ApplicationController

  def show
    @uploaded_item = UploadedItem.find(params[:id])
    render json: UploadedItemSerializer.new(@uploaded_item)
                                       .serializable_hash[:data]

  end
    
end    