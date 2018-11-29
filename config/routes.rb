Rails.application.routes.draw do
  get '/bemvindo' => 'home#index'
  root 'home#index'

  resources :phones
  resources :addresses
  resources :contacts
  resources :kinds

end
