Rails.application.routes.draw do
  resources :movies, only: [:index, :new, :create, :show]
  resources :oscar_categories, only: [:index, :show, :update]
  get '/add_movies', to: 'oscar_categories#edit'
  put 'movies/', to: 'movies#update', as: :movie_seen_update
end
