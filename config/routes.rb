Rails.application.routes.draw do
  resources :to_dos, only: [:index, :create, :update, :destroy]
end
