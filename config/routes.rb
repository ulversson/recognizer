Rails.application.routes.draw do
  root "home#index"
  resources :upload_items
end
