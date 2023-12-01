Rails.application.routes.draw do
  get '/products/new', to: 'products#new', as: :newproduct
  post '/products', to: 'products#create'  # Agrega esta línea para la creación de productos
  get '/products', to: 'products#index'
  get '/products/:id', to: 'products#show', as: :product
end
