Rails.application.routes.draw do
  root "flights#index"
  resources :flights, only: [ :index, :show ]
  get "up" => "rails/health#show", as: :rails_health_check
end
