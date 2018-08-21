Rails.application.routes.draw do
  root to: 'chateaux#index'
  resources :chateaux, only: :show

  namespace :admin do
    root to: 'dashboard#index'
    resources :chateaux, except: :show
  end
end
