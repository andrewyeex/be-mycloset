Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :outfits
  resources :clothings do
    put '/isFavorite', to: 'clothings#isFavorite'
  end
  get '/clothings/type/:type', to: 'clothings#type'
end
