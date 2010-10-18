ProjectRepat::Application.routes.draw do    

  # Authentication
  devise_for :users

  # Wire up default routes index and show (the rest aren't used)
  resources :products

  # Map to static pages
  match '/about' => 'home#about', :as => :about
  match '/history' => 'home#history', :as => :history

  match "/payments" => 'payments#index'

  match "/paypal" => "admin#paypal"

  # Map to login
  # match '/admin/sign_in' => 'users/sign_in'

  # Map home page
  root :to => 'products#index'
  

  # Install the default routes as the lowest priority.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
  match '/:controller(/:action(/:id))'
  
end
