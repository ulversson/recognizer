class AddTableRemovePipelineItem < SeedMigration::Migration
  
  def up
    arguments = {
      name: "Background (Table) remove",
      path: "lib/pipelines/background_remove/background_remove.rb",
      command: "bundle exec ruby",
      arguments: "[input]",
      code: "table_remove"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "table_remove").destroy_all
  end
end
