Rails.application.routes.draw do
  # 管理者側のルーティング
  namespace :admin do
    get '/', to: 'homes#top'
    resources :posts
    resources :pick_ups
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update]
    resources :comments, only: [:index, :destroy]
  end
  
  # devise管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # devise顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 会員側のルーティング設定
  #namescapeからscopeにしたことでpublic出ないように、
  scope module: :public do
    root to: "homes#top"
    get '/about', to: 'homes#about'
    
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'check'
        patch 'out'
        #上記で任意のアクションのルーティング
      end
      #userいいねした投稿のため
      member do
       get 'likes', to: 'likes#index', as: 'likes'
      end
    end

    resources :pick_ups, only: [:show, :index]
    
    resources :posts, only: [:show, :index] do
      collection do
        get 'search'
        get 'tag_search'
        #上記で任意のアクションのルーティング
      end
      #postの resources doの中にある＝ネストできてる。
      resource :likes, only: [:create, :show, :destroy] #do
        #collection do
          #get 'index', as:"index"
        #end
      #end
      
      resources :comments, only: [:index, :create, :destroy]
    end
  end
end