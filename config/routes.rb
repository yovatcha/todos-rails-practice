Rails.application.routes.draw do
  get "brags" => "brags#index"
  get "brag" => "brags#index", as: :brag
  resources :quests
    get "up" => "rails/health#show", as: :rails_health_check
  root "quests#index"
end
