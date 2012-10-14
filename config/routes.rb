TvQueue::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  
  get "queue/index"
  get "queue/add_show"

  get "home/index"
  get "home/terms", :as => "tos"
  get "home/privacy", :as => "privacy"
  get "home/faq", :as => "faq"

  match 'toggle_watched/:episode_id' => "user_watch#toggle_watched", 
    :via => :post, 
    :as => "toggle_watched"

  resources :shows, :only => [:new, :create, :index]
end
