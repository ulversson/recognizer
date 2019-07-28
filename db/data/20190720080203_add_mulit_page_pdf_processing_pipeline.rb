class AddMulitPagePdfProcessingPipeline < SeedMigration::Migration
  def up
    ProcessingPipeline.create!({
      name: "Multi-page PDF printed text extraction",
      code: "multi_page_pdf_printed"
    })
  end

  def down
    ProcessingPipeline.where(code: "multi_page_pdf_printed").destroy_all
  end
end
