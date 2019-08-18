require 'uploaded_items/assigner'
require 'uploaded_items/date_arranger'
require 'processing_result_files/without_case_result_files_query'

class MedicoLegalCasesController < ApplicationController
  before_action :set_case, only: [:show, :destroy]

  include UploadedItems
  include ProcessingResultFiles

  def index
    @medico_legal_cases = MedicoLegalCase.order('id DESC')
    serialized = MedicoLegalCaseSerializer.new(@medico_legal_cases, is_collection: true)
                                          .serializable_hash
    render json: {
      data: serialized[:data].map {|i| i[:attributes]}
    }
  end

  def create
    @medico_legal_case = MedicoLegalCase.new(permitted_params)
    if @medico_legal_case.save
      ProcessingResultFilesAssigner.new(params[:uploaded_files], @medico_legal_case.id).call
    end  
    respond_to {|format| format.js }
  end  
  
  def new
    respond_to do |format|
      format.html do 
        @processed_files = WithoutCaseResultFilesQuery.call
        @processed_files = @processed_files.map {|f| [f.name, f.id]} 
      end
    end
  end  

  def show
    @ordered_items = @medico_legal_case.processing_result_files
                                        .eager_load(:processing_result_dates)
                                        .order("processing_result_dates.discovered_date ASC")
  end  

  def destroy
    @medico_legal_case.destroy
  end  

  private

  def set_case
    @medico_legal_case = MedicoLegalCase.find(params[:id])
  end  

  def permitted_params
    params.require(:medico_legal_case).permit(:name)
  end  
  
end    