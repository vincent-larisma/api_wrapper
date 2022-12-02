Rails.application.routes.draw do
  resources :near_asteroids, only: [:index, :show]
  resources :tech_transfer, only: [:index]
  resources :astronomy, only: [:index]
end
