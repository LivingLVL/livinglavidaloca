Rails.application.routes.draw do
  
  resources :categories
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  resources :orders do 
    resources:orderitems
  end

  devise_for :users do 
    resources :orders 
  end
  
  get '/cart/clearcart', to: 'cart#clearCart'
  get '/checkout' => 'cart#createOrder'
  
  get '/creditcard' => 'static_pages#creditcard'
  get '/paid' => 'static_pages#paid'
  
  get 'cart/index'
  resources :items
  root 'static_pages#home'
 
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  
  get '/login', to: 'user#login' 
  get '/logout', to: 'user#logout'
  
  get '/sold/:id' => 'static_pages#sold'
  
  
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id', to: 'cart#remove'
  get '/cart/removeqty/:id', to: 'cart#removeqty'
  get '/cart/addqty/:id', to: 'cart#addqty'
  
  get 'category/:title', to: 'static_pages#category'
  
  post '/search' => 'items#search'
  
  root :to => 'site#home'
  
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
