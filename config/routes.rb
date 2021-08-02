Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :products, only: %i[index new show create] do
    scope module: :products do
      resources :add_to_carts, only: [:create]
      resources :delete_in_carts, only: [:create]
    end
  end

  resource :cart_item, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
end
