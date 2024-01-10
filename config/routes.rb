Rails.application.routes.draw do
  # Главная страница
  root "home#index"

  # Маршруты для курсов
  get '/courses/add/:id', to: "courses#add", as: :add_course
  get '/courses/remove/:id', to: "courses#remove", as: :remove_course
  resources :courses

  # Маршруты для профилей
  get 'profiles/show'
  get '/profile', to: "home#profile", as: :profile

  # Удаленные ресурсы для Devise
  devise_for :users, controllers: { registrations: "users/registrations" }

  # Авторизация для профилей
  authenticate :user do
    resource :profile, only: :show
  end
end