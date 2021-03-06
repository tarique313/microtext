Microtext::Application.routes.draw do
  
  resources :messages do
    collection do
      get 'compose', :to=>'messages#new', :as=>:compose
      get 'index', :to=> 'messages#index', :as=> :index
      get 'sent', :to=> 'messages#sent', :as=> :sent
      post 'reply', :to=> 'messages#reply', :as=> :reply
      post 'trash', :to=> 'messages#trash', :as=> :trash
    end
  end

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


# Microtext::Application.routes.draw do
 


#  # resources :users
#  resources :users do
#     member do
#       get :following, :followers
#     end
#   end
#  resources :sessions, only: [:new, :create, :destroy]
#  resources :microposts, only: [:create, :destroy]

# root to: 'static_pages#home'

#   match '/signup',  to: 'users#new'
#   match '/signin',  to: 'sessions#new'
#   match '/signout', to: 'sessions#destroy', via: :delete
#   match '/about',   to: 'static_pages#about'
#   match '/help',    to: 'static_pages#help'
#   match '/contact', to: 'static_pages#contact'
 

  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

