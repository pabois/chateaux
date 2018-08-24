Rails.application.routes.draw do
  root to: 'chateaux#index'
  resources :chateaux, only: :show

  namespace :admin do
    root to: 'chateaux#index'
    resources :chateaux, except: :show do
      resources :gallery_images, only: [:create, :destroy]
    end
  end
end
