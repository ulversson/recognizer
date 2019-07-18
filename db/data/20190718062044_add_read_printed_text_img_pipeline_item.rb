class AddReadPrintedTextImgPipelineItem < SeedMigration::Migration
  def up
    arguments = {
      name: "Printed Text OCR",
      path: "lib/pipelines/read_printed_text_img/read_printed_text_img.py",
      command: `which python3`.strip,
      arguments: "[input]",
      code: "read_printed_text_img"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "read_printed_text_img").destroy_all
  end
end
