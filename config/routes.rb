Rails.application.routes.draw do


  root 'main#index'
  get 'about' => "main#about"
  get 'test' => 'main#test'
  get 'testi' => 'main#testi'
  get 'projects' => "main#projects"
  get 'service' => "main#service"

  resources :organizations, :only =>  [:index]  do
    member do
      get 'info'
    end
  end


  resources :articles, :only =>  [:index, :show, :create, :new]  do
    collection do
      # get 'news'

      get 'docs'
     
    end
    member do
      get 'edit'
      post 'edit'
      get 'full_page'
    end
  end


  resources :statistics, :only =>  [:index]  do

  end
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  resources :ratings, only: [:index, :edit] do
    collection do
      get 'add_ambul'
      get 'add_hospital'
      get 'list'
      get 'add_question'
      get 'add_form'
      get 'thank_you'
      get 'edit_form'
      get 'edit_question'
      get 'edit_answer'


      post 'add_ambul'
      post 'add_hospital'
      post 'list'
      post 'add_question'
      post 'add_form'

      put 'edit_form'
      put 'edit_question'
      put 'edit_answer'
    end
  end
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
