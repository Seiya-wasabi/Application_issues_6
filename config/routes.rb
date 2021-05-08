Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get "relationship/:id" => "relationships#index", as: "relationships"
  get "relationship/:id" => "relationships#followers", as: "followed"
  get '/search' => 'searches#search'
  resources :users,only: [:show,:index,:edit,:update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end