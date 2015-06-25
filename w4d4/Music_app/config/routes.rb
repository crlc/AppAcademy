Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :bands, except: :show
  resources :bands, only: :show do
    resources :albums, only: :new
  end
  resources :albums, except: [:index, :new, :show]

  resources :albums, only: :show do
    resources :tracks, only: :new
  end
  resources :tracks, except: [:index, :new] do
    resources :notes
  end

  root to: redirect("/bands")
end
