Rails.application.routes.draw do
  root "home#index"
  resources :uploaded_items
  resources :pipelines, only: [:index, :show]
end
