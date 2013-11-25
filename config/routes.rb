Plays::Application.routes.draw do
  resources :games do
    member do
      get 'finish'
      get 'start'
      get 'fav'
    end
  end

  get 'new' => 'games#new'

  root :to => 'games#index'
end
