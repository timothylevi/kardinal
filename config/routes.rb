Cardinal::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  resource :session, only: [:create, :destroy]
  resources :users, only: [:new, :update, :destroy, :show] do
    member do
      resources :comments, only: :create, as: "user_comments"
    end
  end

  resources :petitions do
    resources :petition_signatures, only: :create, as: :petition_signature
    resources :victories, only: :create
    member do
      resources :comments, only: :create, as: "petition_comments"
    end
    member do
      match :embedded, via: :get
    end
  end

  namespace :api do
    resource :petitions
  end

  resources :recipients, only: [:new, :create, :show]
  resources :victories, only: [:index, :create]
  resources :causes, only: :show
  resources :organizations
  resources :comments, only: :destroy

  match :sign_petition, to: 'petition_signatures#create', via: :post

  get '/login', to: 'sessions#new'
  get 'auth/facebook/callback', to: 'sessions#create'

  get '/me', to: 'users#me'
  get '/me/edit', to: 'users#edit'

  get '/activate/:token', to: 'static_pages#activate', as: 'activate'
  get '/demo', to: 'static_pages#demo', as: 'demo'

  root to: 'petitions#index'

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
end
