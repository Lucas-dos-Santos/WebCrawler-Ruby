Rails.application.routes.draw do
  get 'products', to: 'pages#products'

  get 'crawler', to: 'pages#crawler', as: 'crawler'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
