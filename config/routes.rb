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
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :show, :create, :index]
  end
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
