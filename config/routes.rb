Rails.application.routes.draw do
  resources :pages, only: [:index, :create, :show, :destroy]
end
