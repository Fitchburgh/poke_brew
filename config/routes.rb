Rails.application.routes.draw do
  get 'game/index'

  devise_for :trainers
  # root to: 'pokemon#index'
  root to: 'game#home'

  get 'brewery/index'

  get 'pokemon/index'

  get 'pokemon/submit'

  get 'pokemon/redirect'

  get 'pokemon/get'

  get 'brewery/get'

  get 'brewery/select'

  get 'game/new'

  get 'game/loadout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
