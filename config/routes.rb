Rails.application.routes.draw do
  devise_for :users

resources :offices

root "homes#index"

end
