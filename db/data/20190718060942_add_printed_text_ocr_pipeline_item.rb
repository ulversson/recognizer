class AddPrintedTextOcrPipelineItem < SeedMigration::Migration
  def up
    arguments = {
      name: "Printed Text OCR",
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
#(\b(0?[1-9]|[12]\d|30|31)[^\w\d\r\n:](0?[1-9]|1[0-2])[^\w\d\r\n:](\d{4}|\d{2})\b)|(\b(0?[1-9]|1[0-2])[^\w\d\r\n:](0?[1-9]|[12]\d|30|31)[^\w\d\r\n:](\d{4}|\d{2})\b)
