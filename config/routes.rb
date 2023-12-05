Rails.application.routes.draw do
  get 'profiles/show'
  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: { registrations: "users/registrations" }

  authenticate :user do
    resource :profile, only: :show
  end
end