Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'home#index', as: :home
  get '/about' => 'home#about'
  # get '/posts/new' => 'posts#new', as: :posts
  # post 'posts/new' => 'posts#create'
  #
  # get 'posts/:id' => 'posts#show', as: :post
  #
  # get 'posts/' => 'posts#index', as: :all_posts
  #
  # get 'posts/:id/edit' => 'posts#edit', as: :edit_post
  #
  # patch 'posts/:id' => 'posts#update'
  # delete 'posts/:id' => 'posts#destroy'
  #
  # get 'next_page' => 'posts#next', as: :next_page

  resources :posts do
    resources :comments
    resources :favourites, only: [:create, :destroy]
  end

  resources :users  do

    get :edit, on: :collection
    patch :update, on: :collection
    delete :destroy, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection #this bypasses having id in the url
  end

end
