class AddJpgToPngPipelineItem < SeedMigration::Migration
  def up
    arguments = {
      name: "Directory convert JPG to PNG",
      path: "lib/pipelines/convert_to_png/convert_to_png.sh",
      command: `which bash`.strip,
      arguments: "[input]",
      code: "convert_to_png"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "convert_to_png").destroy_all
  end
end
