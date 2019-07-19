class AddPrintedTextOcrPipelineItem < SeedMigration::Migration
  def up
    arguments = {
      name: "Printed Text OCR (multipage PDF)",
      path: "lib/pipelines/read_printed_text_pdf/read_printed_text_pdf.py",
      command: `which python3`.strip,
      arguments: "[input]",
      code: "read_printed_text_pdf"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "read_printed_text_pdf").destroy_all
  end
end
