Rails.application.routes.draw do
  
   devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
 sessions: 'public/sessions'
 }
  
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
 sessions: "admin/sessions"
 }
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :items, only: [:index, :new, :create, :edit, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :show, :create, :index]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'customers#complete'
    resources :delivery_addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


