Rails.application.routes.draw do

  #ユーザーログイン用
  #URL users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者ログイン用
  #URL admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  root to: 'public/homes#top'

  #ユーザー用
  namespace :public do
    get 'abobut' => 'homes#about'
    resources :users, only: [:show, :edit, :update]
    resources :posted_contents, only: [:new, :create, :index, :show]
  end

   #管理者用
  namespace :admin do
    root to: "homes#top"
    resources :categories, only: [:edit, :create, :index, :update, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
