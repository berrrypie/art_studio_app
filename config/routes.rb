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
  get 'teacher', to: 'teacher#index', as: :teacher_page
  get 'tickets_users/buy/:id', to: 'tickets_users#buy', as: :courses_users_buy
  get 'tickets_users/cancel/:id', to: 'tickets_users#cancel', as: :courses_users_cancel

  # Удаленные ресурсы для Devise
  devise_for :users, controllers: { registrations: "users/registrations" }

  # Авторизация для профилей
  authenticate :user do
    resource :profile, only: :show
  end
end