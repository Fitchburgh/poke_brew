class GameController < ApplicationController
  def index
  end

  def new
    redirect_to '/pokemon/index'
  end

  def home
    if current_trainer.nil?
      redirect_to 'trainers/sign_in'
    end
  end


end
