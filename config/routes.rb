Rails.application.routes.draw do
  root "articles#index"

  devise_for :users
  resources :articles
  resources :mypage, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
