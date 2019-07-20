class PipelinesController < ApplicationController

  def index
    @pipelines = ProcessingPipeline.all
    render json: {
      data: @pipelines
    }
  end

  def show
    processing_pipeline = ProcessingPipeline.find(params[:id])
    @data = processing_pipeline.processing_pipeline_items
                                .includes(:pipeline_item)
                                .order(:position)
  end  

end    