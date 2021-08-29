Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/finance/healthcheck', to: 'application#healthcheck'

  # receipts
  post '/finance/receipts/add', to: 'receipt#add'

  # users
  post '/finance/users/add', to: 'user#add'
  post '/finance/users/investment', to: 'user#investment'
  post '/finance/users/insurance', to: 'user#insurance'
  post '/finance/users/portfolio', to: 'user#portfolio'

  # logs 
  post '/finance/logs/cashback', to: 'log#cashback'
  post '/finance/logs/investment', to: 'log#investment'
  post '/finance/logs/insurance', to: 'log#insurance'
  
end
