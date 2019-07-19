class UploadItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  
  def index
    @uploaded_items = UploadedItem.all
  end

  def show
  end

  def create
    @uploaded_item = UploadedItem.new(item_params)

    if @uploaded_item.save
      render json: @uploaded_item, status: :created, location: root_url
    else
      render json: @uploaded_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @uploaded_item.update(item_params)
      render json: @uploaded_item, status: :ok, location: @uploaded_item
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
    params.permit(:name, :description, :file)
  end
end
