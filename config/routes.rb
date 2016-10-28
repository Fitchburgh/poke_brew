Rails.application.routes.draw do
  devise_for :trainers
  root to: 'pokemon#index'
  
  get 'brewery/index'

  get 'pokemon/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
