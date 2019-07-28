class AddMultipagePipelineItems < SeedMigration::Migration
  def up
    arguments = {
      name: "PDF split by page",
      path: "lib/pipelines/pdf_split_by_page/pdf_split_by_page.py",
      command: `which python3`.strip,
      arguments: "[input]",
      code: "pdf_split_by_page"
    }
    PipelineItem.new(arguments).save(validate: false)
  end

  def down
    PipelineItem.where(code: "pdf_split_by_page").destroy_all
  end
end
