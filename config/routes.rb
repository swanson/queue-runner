TvQueue::Application.routes.draw do
  root :to => 'queue#index'
  devise_for :users
  
  get "queue/index"
  get "queue/add_show"

  resources :user_watch, :only => [] do
    post 'toggle_watched'
  end
end
