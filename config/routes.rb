ProjectRepat::Application.routes.draw do    

  resources :products
  
  match 'about' => 'home#about'
  match 'history' => 'home#history'

  root :to => "products#index"

  
end
