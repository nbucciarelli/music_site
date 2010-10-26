MusicSite::Application.routes.draw do
  devise_for :users

  # devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  
  resources :songs do
    member do
      post :user_upvote
      post :user_downvote
    end
  end
  
  # match '/songs/:id/user_upvote', :to => 'songs#user_upvote', :as => 'user_upvote', :via => 'post'
  
  # match '/songs/:id/user_downvote', :to => 'songs#user_downvote', :as => 'user_downvote', :via => 'post'
  
  # match '/songs/new', :to => 'songs#new', :as => :new_song

  root :to => 'dashboard#index'
end
