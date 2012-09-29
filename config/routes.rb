TvQueue::Application.routes.draw do
  root :to => 'queue#index'
  devise_for :users
  
  get "queue/index"
end
