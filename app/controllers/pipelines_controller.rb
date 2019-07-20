class PipelinesController < ApplicationController

  def index
    @pipelines = ProcessingPipeline.all
    render json: {
      data: @pipelines
    }
  end

  def show
    processing_pipeline = ProcessingPipeline.where(id: params[:id])
    serialized = PipelineSerializer.new(processing_pipeline).serializable_hash
    render json: {
      data: serialized[:data][0][:attributes][:items],
      id: serialized[:data][0][:id]
    }
  end  

end    