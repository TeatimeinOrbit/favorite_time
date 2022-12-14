Rails.application.routes.draw do

  root to: 'public/homes#top'

  # 管理者ログイン用
  #URL admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

   # 管理者用
  namespace :admin do
    root to: "homes#top"
    resources :categories, only: [:edit, :create, :index, :update, :destroy]
    resources :time_of_days, only: [:edit, :create, :index, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end


  # ユーザーログイン用
  #URL users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # ユーザー用
  namespace :public do

    get 'about' => 'homes#about'
    get 'requesting' => 'homes#requesting'

    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        # "いいね"した投稿一覧表示ページ
        get 'favorites'
        # 退会確認画面
        get 'confirm'
        # 退会処理用
        patch 'quit'
      end
      collection do
        get 'search'
      end
    end

    resources :posted_contents, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :posted_comments, only: [:create, :destroy]
      resources :reports, only: [:new, :create, :destroy]
      collection do
        get 'search'
      end
    end

    resources :user_interests, only: [:create, :update, :index]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
