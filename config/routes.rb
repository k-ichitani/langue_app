Rails.application.routes.draw do
  root to: "homes#top"
  get '/about', to: 'homes#about'
  resources :schedules do
    resources :reservations, only: [:new, :index]
      post 'reservations/confirm', to: 'reservations#confirm'
      get 'reservations/complete', to: 'reservations#complete'
      post 'reservation/complete', to: 'reservations#create'
  end
  resources :reservations, only: [:show, :edit, :update, :destroy]
  resources :teachers, only: [:index]
    get 'teachers/information/:id', to: 'teachers#show', as: 'teachers_information'
    get 'teachers/information/:id/edit', to: 'teachers#edit', as: 'edit_teachers_information'
    patch 'teachers/information/:id', to: 'teachers#update'
    get 'teachers/confirm'
    patch 'teachers/withdraw'
  resources :students, only: [:index]
    get 'students/information/:id', to: 'students#show', as: 'students_information'
    get 'students/information/:id/edit', to: 'students#edit', as: 'edit_students_information'
    patch 'students/information/:id', to: 'students#update'
    get 'students/confirm', to: 'students#confirm'
    patch 'students/withdraw', to: 'students#withdraw'

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #先生用
  #URL /teachers/sign_in ...
  devise_for :teachers, skip: [:registrations, :passwords], controllers: {
    sessions: "teacher/sessions"
  }

  # 生徒用
  # URL /students/sign_in ...
  devise_for :students, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # ゲストログイン
  devise_scope :student do
    post 'students/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
