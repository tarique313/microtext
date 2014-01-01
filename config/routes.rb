Microtext::Application.routes.draw do


  resources :users do
    collection do 
      post :create_comment
    end
    member do
      get :following, :followers
    end
  end
  resources :inquiries, :only => [:new, :create] do
  get 'thank_you', :on => :collection
end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :messages do
    collection do
      get 'compose', :to=>'messages#new', :as=>:compose
      get 'index', :to=> 'messages#index', :as=> :index
      get 'sent', :to=> 'messages#sent', :as=> :sent
      post 'reply', :to=> 'messages#reply', :as=> :reply
      post 'trash', :to=> 'messages#trash', :as=> :trash
    end
  end
  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
       
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
 # match '/contact', to: 'contact_us/contacts#new'
  match '/search',  to: 'users#search_users'
  match '/recommended_friends', to: 'users#recommended_friends'
  match '/getting_started', to: 'static_pages#getting_started'
  match '/signing_up', to: 'static_pages#signing_up'
  match '/post_microtext', to: 'static_pages#post_microtext'

end


