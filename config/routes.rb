TvQueue::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  
  get "queue/index"
  get "queue/add_show"
  get "home/index"

  match 'toggle_watched/:episode_id' => "user_watch#toggle_watched", 
    :via => :post, 
    :as => "toggle_watched"

  match 'toggle_watched_no_remove/:episode_id' => "user_watch#toggle_watched_no_remove", 
    :via => :post, 
    :as => "toggle_watched_no_remove"

  resources :shows, :only => [:new, :create, :index]
end
