require 'application_base_service'
module ProcessingResultFiles 
  class ProcessingResultFilesAssigner < ApplicationBaseService
      
    attr_reader :processing_result_files, :medico_legal_case_id

    def initialize(result_files_ids, medico_legal_case_id)
      @processing_result_files = ProcessingResultFile.where(id: result_files_ids)
      @medico_legal_case_id = medico_legal_case_id
    end  

    def call
      return if processing_result_files.blank?
      processing_result_files.each do |result_file|
        result_file.uploaded_item.update_column(:medico_legal_case_id, medico_legal_case_id)
        result_file.update_column(:medico_legal_case_id, medico_legal_case_id)
      end  
      true
    end

  end  
end
