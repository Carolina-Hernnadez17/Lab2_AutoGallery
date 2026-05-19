Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "marcas#index"

  resources :marcas, only: %i[index show new create] do
    resources :vehiculos, only: %i[show new create] do
      resources :fotografias, only: %i[new create]
    end
  end
end
