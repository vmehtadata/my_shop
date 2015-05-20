Rails.application.routes.draw do
  root to: redirect('/products')

  devise_for :users
  resources :products
end
