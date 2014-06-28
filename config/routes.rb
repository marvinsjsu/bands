Bands::Application.routes.draw do
  resources :users, except: [:edit, :update]

  resources :bands do
    resources :albums, only: [:index, :new, :create]
  end

  resources :albums, only: [:show, :edit, :update, :destroy] do
    resources :tracks, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]

  get "logout" => "sessions#destroy"
end
