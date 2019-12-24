Rails.application.routes.draw do
  root 'albums#index'

  resources :albums do
    resources :pictures, only: [:show, :new, :create, :edit, :update]
  end
end
