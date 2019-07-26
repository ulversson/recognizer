class ProcessingsController < ApplicationController

  def create
    @uploaded_item = UploadedItem.find(params[:id])
    @uploaded_item.update_column :status, "processing"
    UploadedItemWorker.perform_async(@uploaded_item.id)
    head :ok
  end  

end    