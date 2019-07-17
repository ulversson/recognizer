class AddDateExtractionPipelines < SeedMigration::Migration
  def up
    ["Handwritten Date Extaction", "Printed Date Extraction"].each do |name|
      ProcessingPipeline.create! name: name
    end  
  end

  def down
    ProcessingPipeline.destroy_all
  end
end
