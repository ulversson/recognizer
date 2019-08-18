require "pipeline/single_page_text_processor"
require "pipeline/multi_page_processor"
class UploadedItemWorker
  
  include Sidekiq::Worker

  def perform(uploaded_item_id)
    uploaded_item = UploadedItem.find(uploaded_item_id)
    if uploaded_item.processing_pipeline.multipage?
      Pipeline::MultiPageProcessor.new(uploaded_item).call
    else
      Pipeline::SinglePageTextProcessor.new(uploaded_item).call
    end  
  end
end
