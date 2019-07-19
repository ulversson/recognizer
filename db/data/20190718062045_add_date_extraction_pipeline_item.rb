class AddDateExtractionPipelineItem < SeedMigration::Migration
  def up
    arguments = {
      name: "Extract Date From Text",
      path: "lib/pipelines/date_text_extraction/date_text_extraction.rb",
      command: "bundle exec ruby",
      arguments: "[input]",
      code: "date_text_extraction"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "date_text_extraction").destroy_all
  end
end
