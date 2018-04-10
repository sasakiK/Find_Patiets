Rails.application.routes.draw do

  root "tops#index"

  resources :results, only: [:index]

  get "results/:id/download" => "results#download"

  get "/" => "home#top"
  get "about" => "home#about"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
