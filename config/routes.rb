Rails.application.routes.draw do
  namespace :admin do
    resources :reservations, only: [:index, :show, :edit, :update]
    resources :schedules
    resources :teachers, only: [:index]
      get 'teachers/mypage', to: 'teachers#show', as: 'teacher'
      get 'teachers/information/edit', to: 'teachers#edit', as: 'edit_teacher'
      patch 'teachers/information', to: 'teachers#update'
      get 'teachers/confirm'
      patch 'teachers/withdraw'
    resources :students, only: [:index, :show, :edit, :update]
  end
  scope module: :admin do
    get 'admin', to: 'homes#top'
  end
  
  scope module: :public do
    resources :teachers, only: [:index, :show]
    resources :schedules, only: [:index, :show]
    resources :reservations, only: [:new, :index, :show, :edit, :update, :destroy]
      post 'reservations/confirm', to: 'reservations#confirm'
      get 'reservations/complete', to: 'reservations#complete'
      post 'reservation/complete', to: 'reservations#create'
    get 'students/mypage', to: 'students#show'
    get 'students/information/edit', to: 'students#edit'
    patch 'students/information', to: 'students#update'
    get 'students/confirm', to: 'students#confirm'
    patch 'students/withdraw', to: 'students#withdraw'
    get 'homes/about'
  end
  root to: "public/homes#top"

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 生徒用
  # URL /students/sign_in ...
  devise_for :students, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
