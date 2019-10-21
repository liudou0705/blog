Rails.application.routes.draw do


  resources :companies
  get 'users/signup'

      get 'issues/show'

      #root 'welcome#index'
      # get 'welcome/index'

      resources :articles


      root   'page#welcome'
      get    '/about' => 'page#about'
      get    'signup' => 'users#signup', :as => 'signup'
      get    'login' => 'users#login',  :as => 'login'
      post "create_login_session" => "users#create_login_session"
      delete "logout" => "users#logout", :as => "logout"

      #get '/issues/new' => "issues#new"
      #get '/issues/:id' => "issues#show", :as => "issue"
      #delete 'issues/:id' => 'issues#destroy'
      #get 'issues' => 'issues#index', :as => 'issues'
      #post 'issues' => 'issues#create'
      #get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'
      #patch 'issues/:id' => 'issues#update'
      resources :issues

      #commments
      post '/issues/:issue_id/comments' => 'comments#create'

      resources :users, only: [:create]


end
