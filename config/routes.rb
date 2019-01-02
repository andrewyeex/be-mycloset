Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clothings
  get '/clothings/type/:type', to: 'clothings#type'
end
