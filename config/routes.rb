Rails.application.routes.draw do
  resources :movies, except: [:new, :create]
end
