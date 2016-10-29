require 'json'
require 'redis'
require 'pry'


class PokemonController < ApplicationController
  def index
    pkmn_object = Pokemon.new('name' => 'zubat', 'list' => '')
    pkmn_object.write_to(pkmn_object)
    respond_to do |format|
      format.json { render json: (pkmn_object.pkmn_readout).to_json }
      format.html { render :index }
    end

  end

  def submit

  end
end

# <% pkmn_object = Pokemon.new('name' => 'articuno', 'list' => @poke_list)#, 'id_names' => pkmn_name_and_id) %>
# <% pkmn_object.write_to(pkmn_object) %>
