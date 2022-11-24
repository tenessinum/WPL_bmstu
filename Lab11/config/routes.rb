Rails.application.routes.draw do
  root 'simons#new'
  resources :simons, only: %i[index show destroy new create]
end
