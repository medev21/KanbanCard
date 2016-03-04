Rails.application.routes.draw do
  devise_for :users
  resources :boards do
    resources :lists do
      resources :cards
    end
    # resources :cards
  end

  root 'boards#index'
  # get '/boards/:board_id/lists/:list_id/cards/new' => 'cards#new', :as => :cards
end
