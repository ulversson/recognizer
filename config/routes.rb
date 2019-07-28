Rails.application.routes.draw do
  root "home#index"
  resources :uploaded_items do 
    member do 
      get :text_file
    end  
  end  
  resources :pipelines, only: [:index, :show]
  resources :processings, only: [:create]
  resources :medico_legal_cases
  resources :processing_results, only: [:show]
end
