Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  get 'home/about' => 'home#about', as: 'about'
  root to: 'home#top' 

  # get 'homes/about' => 'homes#about', as: 'about'
  # root to: 'homes#top' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
