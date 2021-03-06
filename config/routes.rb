Rails.application.routes.draw do

  get 'search/search'
   devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  root'home#top'
  get 'home/top' => 'home#top'
  get 'home/about' => 'home#about'
  resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  resource :customer, only: [:show, :edit, :update] do
    member do
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdrawl' => 'customers#withdrawl'
    end
  end
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:index, :show, :create, :new]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:index, :show, :create, :new]
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :show, :create, :destroy, :update] do
    collection do
      delete 'destroy_all'
    end
  end

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  namespace :admins do
    root 'home#top'
    get 'home/top' => 'home#top'
    get '/search' => 'search#search'
    resources :order_items, only: [:update]
    resources :orders, only: [:index, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :create, :new, :show, :edit, :update]
  end
end