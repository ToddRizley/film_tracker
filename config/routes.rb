Rails.application.routes.draw do
  resources :movies, only:[:index, :new, :create, :show]

  put 'movies/', to: 'movies#update', as: :movie_seen_update

end
