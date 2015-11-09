Rails.application.routes.draw do
  devise_for :users
  resources :boards do
    resources :lists
  end

  root 'boards#index'
end
