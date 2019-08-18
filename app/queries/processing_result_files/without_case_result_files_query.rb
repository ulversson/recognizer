module ProcessingResultFiles
  class WithoutCaseResultFilesQuery

    DEFAULT_STATUS = :processed

    def self.call(relation = ProcessingResultFile.all, status: DEFAULT_STATUS)
      relation
        .eager_load(:uploaded_item)
        .search_name("txt")
        .where(medico_legal_case_id: nil)
    end

  end  
end  
