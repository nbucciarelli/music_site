MusicSite::Application.routes.draw do
  devise_for :users

  # devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  
  resources :songs
  
  match '/songs/:id/user_up_voted', :to => 'songs#user_upvoted', :as => 'user_upvoted'
  
  match '/songs/:id/user_down_voted', :to => 'songs#user_downvoted', :as => 'user_downvoted'
  
  # match '/songs/new', :to => 'songs#new', :as => :new_song

  root :to => 'dashboard#index'
end
