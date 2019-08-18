module UploadedItems
  class WithoutAssignedCaseAndStatusQuery

    DEFAULT_STATUS = :processed

    def self.call(relation = UploadedItem.all, status: DEFAULT_STATUS)
      relation
        .where(status: DEFAULT_STATUS, medico_legal_case_id: nil)
    end

  end  
end  
