TvQueue::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  
  get "queue/index"
  get "queue/add_show"
  get "home/index"

  resources :user_watch, :only => [] do
    post 'toggle_watched'
  end

  resource :show, :only => [:new, :create]
end
