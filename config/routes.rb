Rails.application.routes.draw do
  devise_for :users


resources :sites, shallow: true do
  resources :spaces do
    resources :photos
  end
end

  resources :amenities
  resources :spaces
  root "homes#index"
end
