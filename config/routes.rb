Rails.application.routes.draw do
  devise_for :users

resources :sites do
  resources :spaces
end
  resources :amenities

root "homes#index"

end
