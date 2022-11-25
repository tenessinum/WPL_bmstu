Rails.application.routes.draw do
  get 'simons/input'
  get 'simons/result'
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  root 'simons#input'
end
