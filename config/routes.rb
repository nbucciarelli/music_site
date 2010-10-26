MusicSite::Application.routes.draw do
  devise_for :users

  # devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  
  resources :songs do
    member do
      put :user_upvoted
      put :user_downvoted
    end
  end
  
  # match '/songs/new', :to => 'songs#new', :as => :new_song

  root :to => 'dashboard#index'
end
