Rails.application.routes.draw do

  get "/" => "home#top"
  get "about" => "home#about"

  get "result" => "home#result"

  resources :results, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
