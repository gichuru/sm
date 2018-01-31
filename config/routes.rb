Rails.application.routes.draw do
  devise_for :users

resources :sites do
  resources :spaces
end

root "homes#index"

end
