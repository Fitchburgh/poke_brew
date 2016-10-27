require 'json'

class PokemonController < ApplicationController
  def index
    @poke_list = JSON.parse(File.read('cache/pokemon/pokemon.json'))
# maybe add weight and how much they can drink or something

  end
end
