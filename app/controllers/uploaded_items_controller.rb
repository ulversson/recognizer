require 'uploaded_items/text_file_finder'
class UploadedItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @uploaded_items = UploadedItemSerializer.new(UploadedItem.all.order("id desc"), {is_collection: true})
    render json: {
      data: @uploaded_items.serializable_hash[:data].map {|i| i[:attributes]}
    }
  end

  def show
  end

  def text_file
    txt_file = ProcessingResultFile.find(params[:id])
    send_file txt_file.file_on_disk, 
      filename: txt_file.file.filename.to_s,
      disposition: :attachment
  end  

  def create
    @uploaded_item = UploadedItem.new(item_params)
    if @uploaded_item.save
      render json: @uploaded_item, status: :created, location: "/"
    else
      render json: @uploaded_item.errors, status: :unprocessable_entity
    end
  end

  def update
    update_params = params.require(:uploaded_item).permit(:processing_pipeline_id, :status)
    if @uploaded_item.update(update_params)
      render json: { "success": true}
    else
      render json: @uploaded_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @uploaded_item.destroy
  end

  private
  
  def set_item
    @uploaded_item = UploadedItem.find(params[:id])
  end

  def item_params
    params.permit(:processing_pipeline_id, :status, :file)
  end
end