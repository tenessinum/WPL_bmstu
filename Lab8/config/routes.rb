Rails.application.routes.draw do
  get 'simons_hypothesis/result'
  get 'simons_hypothesis/input'

  root 'simons_hypothesis#input'
end
