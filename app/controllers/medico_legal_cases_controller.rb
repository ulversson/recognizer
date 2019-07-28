require 'uploaded_items/assigner'
require 'uploaded_items/date_arranger'
require 'uploaded_items/without_assigned_case_and_status_query'

class MedicoLegalCasesController < ApplicationController
  before_action :set_case, only: [:show, :destroy]

  include Services::UploadedItems
  include Queries::UploadedItems

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
      Assigner.new(params[:uploaded_files], @medico_legal_case.id).call
    end
    respond_to {|format| format.js }
  end  
  
  def new
    respond_to do |format|
      format.html do 
        @processed_files = WithoutAssignedCaseAndStatusQuery.call
        @processed_files = @processed_files.map {|f| [f.file.filename.to_s, f.id]} 
      end
    end
  end  

  def show
    @ordered_items = DateArranger.new(@medico_legal_case.uploaded_items).call.compact
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