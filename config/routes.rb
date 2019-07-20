Rails.application.routes.draw do
  root "home#index"
  resources :upload_items
  resources :pipelines, only: [:index, :show]
end
