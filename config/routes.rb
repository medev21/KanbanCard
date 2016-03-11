Rails.application.routes.draw do
  devise_for :users

  # resources :boards do
  #   resources :lists
  # end
  #
  # resources :lists do
  #   resources :cards
  # end
  #
  # resources :cards do
  #   patch 'change_list_id', on: :member
  # end

  # resources :boards do
  #   resources :lists do
  #     resources :cards do
  #       patch 'change_list_id', on: :member
  #     end
  #   end
  # end

  resources :boards do
    resources :lists do
      collection { post :sort } #post is the request eg.get
    end
    resources :cards do
      patch 'change_list_id', on: :member
    end
  end

  root 'boards#index'

  # resources :cards do
  #   patch 'change_list_id', on: :member
  # end
  # get '/boards/:board_id/lists/:list_id/cards/new' => 'cards#new', :as => :cards
end
