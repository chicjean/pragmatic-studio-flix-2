Rails.application.routes.draw do

  resources :genres

	resource :session

	get 'signin' => 'sessions#new'

	get 'signup' => 'users#new'
	
  resources :users

  get 'movies/filter/:scope' => 'movies#index', as: :filtered_movies

  # get 'movies/filter/hits' => 'movies#index', scope: 'hits'
  # get 'movies/filter/flops' => 'movies#index', scope: 'flops'

  root "movies#index"
  resources :movies do
    resources :reviews
    resources :favorites
  end
end
