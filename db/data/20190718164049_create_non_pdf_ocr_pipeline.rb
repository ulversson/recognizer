class CreateNonPdfOcrPipeline < SeedMigration::Migration
  def up
    pp = ProcessingPipeline.where(code: "printed_date_extraction").first
    pi = PipelineItem.where(code: "table_remove").first
    pi2 = PipelineItem.where(code: "image_preprocessing").first
    pi3 = PipelineItem.where(code: "read_printed_text_img").first
    pi4 = PipelineItem.where(code: "date_text_extraction").first
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi.id,
      order: 1
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi2.id,
      order: 2
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi3.id,
      order: 3
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi4.id,
      order: 4
    })
  end

  def down

  end
end
