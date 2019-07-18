class AddTextPreprocessing < SeedMigration::Migration
  def up
    arguments = {
      name: "Preprocess Image for OCR",
      path: "lib/pipelines/preprocess_image/preprocess_image.py",
      command: `which python3`.strip,
      arguments: "[input]",
      code: "image_preprocessing"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "image_preprocessing").destroy_all
  end
end
