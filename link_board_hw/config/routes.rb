Rails.application.routes.draw do

  # get 'users/new'

  # get 'users/create'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'
    # You can have the root of your site routed with "root"
  root 'posts#index'

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:index, :new, :create]
  end

# Auth routes

  get   "/signup" => "users#new"
  # render user sign up form

  post  "/signup" => "users#create"
  # create user in database (signup)

  get   "/login"  => "sessions#new"
  # render user log in form

  post  "/login"  => "sessions#create"
  # create user session (login)

  get   "/logout" => "sessions#destroy"
  # destroy user session (logout)

# Post routes

  get   "/"          => "posts#index"
  # render list of all posts

  get   "/posts/new" => "posts#new"
  # render add post form

  post  "/posts"     => "posts#create"
  # create post in database (associated to logged in user)


  # get 'posts/new'

  # get 'posts/create'

  # get 'posts/update'

  # get 'posts/edit'

  # get 'posts/destroy'

  # get 'posts/index'

  # get 'posts/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
