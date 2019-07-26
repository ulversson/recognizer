require "pipeline/processor"

class UploadedItemWorker
  
  include Sidekiq::Worker
  include Services

  def perform(uploaded_item_id)
    uploaded_item = UploadedItem.find(uploaded_item_id)
    Pipeline::Processor.run(uploaded_item)
  end
end
