#
class GameController < ApplicationController
  def index
  end

  def home

    # this feels primitive.  Plan is to have it root to the sign in, and have a navbar to sign in, create new, and have redirects based on button click in JS?
    redirect_to '/trainers/sign_in' if current_trainer.nil?
  end

  def loadout
    # should show pokemon that you're ready to fight with or a list to select from
    # add conditional if, if nothing is there to redirect to /pokemon/index or /game/home
  end
end
