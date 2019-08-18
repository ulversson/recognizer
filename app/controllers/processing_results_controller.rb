class ProcessingResultsController < ApplicationController

  def show
    @uploaded_item = ProcessingResultFile.find(params[:id])
    render json: ProcessingResultFileSerializer.new(@uploaded_item)
                                              .serializable_hash[:data]

  end
    
end    