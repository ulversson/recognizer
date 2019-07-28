class AddMultipagePdfPipeline < SeedMigration::Migration
  def up
    pp = ProcessingPipeline.where(code: "multi_page_pdf_printed").first
    pi = PipelineItem.where(code: "pdf_split_by_page").first
    pi2 = PipelineItem.where(code: "convert_to_png").first
    pi3 = PipelineItem.where(code: "table_remove").first
    pi4 = PipelineItem.where(code: "image_preprocessing").first
    pi5 = PipelineItem.where(code: "fix_orientation").first
    pi6 = PipelineItem.where(code: "read_printed_text_pdf").first
    pi7 = PipelineItem.where(code: "date_text_extraction").first

    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi.id,
      position: 1
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi2.id,
      position: 2
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi3.id,
      position: 3
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi4.id,
      position: 4
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi5.id,
      position: 5
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi6.id,
      position: 6
    })
    ProcessingPipelineItem.create!({
      processing_pipeline_id: pp.id,
      pipeline_item_id: pi7.id,
      position: 7
    })
  end

  def down

  end
end
