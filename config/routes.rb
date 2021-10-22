Rails.application.routes.draw do
  resources :artists, :genres, :songs
end
