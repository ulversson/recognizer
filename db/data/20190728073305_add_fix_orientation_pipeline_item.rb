class AddFixOrientationPipelineItem < SeedMigration::Migration
  def up
    arguments = {
      name: "Rotate image to portrait",
      path: "lib/pipelines/fix_orientation/fix_orientation",
      command: `which python3`.strip,
      arguments: "[input]",
      code: "fix_orientation"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "fix_orientation").destroy_all
  end
end
