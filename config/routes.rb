Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "marcas#index"

  resources :marcas
  resources :vehiculos
  resources :fotografias
end
