class UploadItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  
  def index
    @items = UploadItem.all
  end

  def show
  end

  def create
    @item = UploadItem.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item, status: :ok, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private
  
  def set_item
    @item = UploadItem.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :file)
  end
end
