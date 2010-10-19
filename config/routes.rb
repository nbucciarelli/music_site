MusicSite::Application.routes.draw do
  devise_for :users
  
  # devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  
  resources :songs

  root :to => 'dashboard#index'
end
