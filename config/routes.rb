Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'site#index'
  #Main_Page
  post '/contactus' => 'site#contact_us'
  post '/subscribe' => 'site#subscribe'

#Employment
get '/employment' => 'site#employment'
post '/employment' => 'site#newapp'

#Applications
get '/applications/:app_id' => "applications#show"
#notes
get '/notes' => 'notes#index'
post '/notes' => 'notes#create'
get '/notes/new' => 'notes#new'
get '/notes/:id' => 'notes#show'

#Home
get '/:user_id/home/:newLogin' => 'home#index'
get '/:user_id/home' => 'home#index'
get '/:user_id/applications' => "applications#index"

#Payrolls
get '/admin/payrolls' => 'payrolls#index', as: 'payrolls'
get '/admin/payrolls/new' => 'payrolls#new', as: 'payrolls_new'


#Nova
get '/nova' => "nova#index", as: 'nova_home'
  #Nova Bulletin
  get '/nb/new' => 'novabulletins#new', as: "new_nova_bulletin"
  get '/nb' => 'novabulletins#index', as: "nova_bulletin"
  post '/nb/new' => 'novabulletins#create'
  get '/nb/edit/:user_id/:bulletin_id' => 'novabulletins#edit', as: "edit_nova_bulletin"
  post '/nb/update/:user_id/:bulletin_id' => 'novabulletins#update'
  get '/nb/del/:user_id/:bulletin_id' => 'novabulletins#delete'
  #NBComments
  get '/nb/addnbcomment/:comment_id' => 'nbcomments#delete'
  post '/nb/addnbcomment/:bulletin_id' => 'nbcomments#new'
#testing
get '/invoices/:id' => 'invoices#show'

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
