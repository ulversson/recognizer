class AddMulitPagePdfProcessingPipeline < SeedMigration::Migration
  def up
    ProcessingPipeline.create!({
      name: "Multi-page PDF printed text extraction",
      code: "multi-page-pdf-printed"
    })
  end

  def down
    ProcessingPipeline.where(code: "multi-page-pdf-printed").destroy_all
  end
end
