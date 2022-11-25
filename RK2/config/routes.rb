Rails.application.routes.draw do
  get 'rk/input'
  get 'rk/result'
  root 'rk#input'
end
