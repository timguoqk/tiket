Rails.application.routes.draw do
  get 'party_time' => 'party_time#index'
  root 'home#index'

  devise_for :users, :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  namespace :api do
    namespace :v1 do
      #get 'users/check(.:format)' => 'users#check_is_signed_up'
      post 'upload/image(.:format)'
      #devise_for :users
      post 'comment(.:format)' => 'comments#create'
      get 'comments(.:format)' => 'comments#list'

      post 'admission(.:format)' => 'admissions#create'

      get 'party/data(.:format)' => 'party_data#data'
      get 'party/list(.:format)' => 'party_data#list'
      get 'party/change_status(.:format)' => 'party_data#change_status'
      get 'party/status' => 'party_data#status'
      post 'party/change_rate' => 'party_data#change_rate'
    end
  end

  # Faye Server

  #faye_server '/faye', :timeout => 75 do
  #  map 'messages/*' => MessagesController
  #end


  get ':shortname' => 'events#show', as: 'event'
  #post 'events(.:format)' => 'events#create'
  get ':shortname/edit(.:format)' => 'events#edit', as: 'edit_event'
  patch ':shortname' => 'events#update'
  put ':shortname' => 'events#update', as: 'update_event'
  delete ':shortname' => 'events#destroy', as: 'destroy_event'
  resource :events

  post ':shortname/tickets(.:format)' => 'collections#create', as: 'event_collections'

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
