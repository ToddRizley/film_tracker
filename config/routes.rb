Rails.application.routes.draw do
  resources :movies, only: [:index, :new, :create, :show]
  resources :oscar_categories, only: [:index, :show]
  get '/add_movies', to: 'oscar_categories#edit'
  put 'movies/', to: 'movies#update', as: :movie_seen_update
  put '/add_movies', to: 'oscar_categories#add_movies_to_categories', as: :add_movies_to_categories
end
