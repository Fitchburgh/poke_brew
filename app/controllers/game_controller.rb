#
class GameController < ApplicationController
  def index
    redirect_to '/trainers/sign_in' if current_trainer.nil?
  end

  def home

  end

  def loadout
  end

  def battle
  end
end
