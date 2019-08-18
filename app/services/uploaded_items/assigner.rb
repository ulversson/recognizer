require 'application_base_service'
  module UploadedItems 
    class Assigner < ApplicationBaseService
      
      attr_reader :uploaded_items_ids, :medico_legal_case_id

      def initialize(uploaded_items_ids, medico_legal_case_id)
        @uploaded_items_ids = uploaded_items_ids
        @medico_legal_case_id = medico_legal_case_id
      end  

      def call
        return if uploaded_items_ids.blank?

        uploaded_items_ids.each do |file_id|
          uploaded_file = UploadedItem.find(file_id)
          uploaded_file.update_column(:medico_legal_case_id, medico_legal_case_id) if uploaded_file
        end  
        true
      end

    end  
  end