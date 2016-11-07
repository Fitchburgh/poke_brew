Rails.application.routes.draw do
  get '/' => 'game#index'

  devise_for :trainers
  # root to: 'pokemon#index'
  # root 'trainers#sign_in'

  get 'brewery/index'

  get 'pokemon/index'

  get 'pokemon/submit'

  get 'pokemon/redirect'

  get 'pokemon/get'

  get 'brewery/get'

  get 'brewery/select'

  get 'game/new'

  get 'game/loadout'

  get 'game/battle'
end
