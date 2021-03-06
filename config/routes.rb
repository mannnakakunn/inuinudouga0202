Inuinudouga::Application.routes.draw do

  get "base/index"
  # root 'dogs/index'
  get  '/admin' => 'admin/base#index'

  root 'dogs#index'  
  devise_for :users,:controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    # :omniauth_callbacks => "users/omniauth_callbacks" 
  }

  resources :users, :only => [:index, :show]
  
  resources :dogs do # => tagアクションを追加しました。
     collection do
      get 'tag'
    end
  end

  resources :dogs do
  get "bookmarks/toggle"
  end
  
  get '/mypage' => 'dogs#mypage'
  get '/scrape' => 'dogs#scrape'
  get '/flickr_search' => 'dogs#flickr_search'
  get '/about' => 'dogs#about'
  get '/rank' => 'dogs#rank',as: 'rank'
  get '/year' => 'dogs#year',as: 'year'
  get '/choice' => 'dogs#choice',as: 'choice'
  # get '/:id' => 'dog#show' ,as: 'dog'
  get '/contact' => 'dogs#contact' ,as: 'contact'
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
