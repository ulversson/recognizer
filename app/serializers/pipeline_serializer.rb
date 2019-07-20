class PipelineSerializer
  include FastJsonapi::ObjectSerializer
  set_type :processing_pipeline
  attributes :id
  has_many :processing_pipeline_items

  attribute :items do |object|
    object.processing_pipeline_items
      .order(:position).map {|i| {
        name: i.pipeline_item.name, 
        id: i.pipeline_item.id,
        position: i.position
      }
    }
  end
end
