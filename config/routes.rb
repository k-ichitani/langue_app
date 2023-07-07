Rails.application.routes.draw do
  namespace :admin do
    resources :reservations, only: [:index, :show, :edit, :update]
    resources :schedules
    resources :teachers, only: [:index]
    resources :students, only: [:index, :show, :edit, :update]
    get 'admin', to: 'homes#top'
    get 'teachers/mypage', to: 'teachers#show', as: 'admin_teacher'
    get 'teachers/information/edit', to: 'teachers#edit', as: 'edit_teacher'
    patch 'teachers/information', to: 'teachers#update'
    get 'teachers/confirm'
    patch 'teachers/withdraw'
    # get 'reservations/index'
    # get 'reservations/show'
    # get 'reservations/edit'
  end
  # namespace :admin do
  #   get 'schedules/new'
  #   get 'schedules/index'
  #   get 'schedules/show'
  #   get 'schedules/edit'
  # end
  # namespace :admin do
  #   get 'teachers/show'
  #   get 'teachers/edit'
  #   get 'teachers/confirm'
  # end
  # namespace :admin do
  #   get 'students/index'
  #   get 'students/show'
  #   get 'students/edit'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  namespace :public do
    get 'teachers/index'
    get 'teachers/show'
  end
  namespace :public do
    get 'schedules/index'
    get 'schedules/show'
  end
  namespace :public do
    get 'reservations/new'
    get 'reservations/complete'
    get 'reservations/index'
    get 'reservations/show'
    get 'reservations/edit'
  end
  namespace :public do
    get 'students/show'
    get 'students/edit'
    get 'students/confirm'
  end
  namespace :public do
    get 'homes/top'
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
