Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/finance/healthcheck', to: 'application#healthcheck'

  post '/finance/transactions/add', to: 'transaction#add'
end
