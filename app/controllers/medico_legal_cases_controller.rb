class MedicoLegalCasesController < ApplicationController


  def index
    @medico_legal_cases = MedicoLegalCase.order("id DESC")
    serialized = MedicoLegalCaseSerializer.new(@medico_legal_cases, is_collection: true)
                                          .serializable_hash
    render json: {
      data: serialized[:data].map {|i| i[:attributes]}
    }
  end

  def create
    @medico_legal_case = MedicoLegalCase.new(permitted_params)
    if @medico_legal_case.save
      params[:uploaded_files].each do |file_id|
        uploaded_file = UploadedItem.find(file_id)
        uploaded_file.update_column(:medico_legal_case_id, @medico_legal_case.id) if uploaded_file
      end  
    end
    respond_to do |f|
      f.js
    end
  end  
  
  def new
    respond_to do |f|
      f.html {@processed_files = UploadedItem.where(status: "processed", medico_legal_case_id: nil).map {|f| [f.file.filename.to_s, f.id]} }
    end
  end  

  def destroy
    @medico_legal_case = MedicoLegalCase.find(params[:id])
    @medico_legal_case.destroy
  end  

  private

  def permitted_params
    params.require(:medico_legal_case).permit(:name)
  end  
  
end    