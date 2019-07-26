class MedicoLegalCaseSerializer
  include FastJsonapi::ObjectSerializer
  set_type :medico_legal_case
  attributes :id, :name

  attribute :files do |object|
    object.processing_result_files.count
  end

  attribute :dates do |object|
    object.processing_result_dates.count
  end
end
