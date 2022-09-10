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

  #ユーザー用
  namespace :public do
    root to: 'homes#top'
    get 'abobut' => 'homes#about'
    resources :posted_contents, only: [:index, :show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
