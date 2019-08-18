require 'application_base_service'
module UploadedItems 
    class DateArranger < ApplicationBaseService

      attr_reader :uploaded_items

      def initialize(uploaded_items)
        @uploaded_items = uploaded_items
      end  

      def call
        (uploaded_items.map do |uploaded_item| 
          uploaded_item.processing_result_dates
                       .order('discovered_date desc')
                       .first 
          end
          .sort_by {|i| i.discovered_date rescue nil })
          .compact
      end  

    end
end
