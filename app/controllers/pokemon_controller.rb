require 'pry'

#
class PokemonController < ApplicationController
  def index
  end

  def get
    pkmn_object = Pokemon.new('name' => params[:pokemon], 'list' => '')
    pkmn_object.write_to(pkmn_object)
    respond_to do |format|
      format.json { render json: pkmn_object.pkmn_readout.to_json }
      format.html { redirect_to '/pokemon/index' }
    end
  end
end

# <% pkmn_object = Pokemon.new('name' => 'articuno', 'list' => @poke_list)#, 'id_names' => pkmn_name_and_id) %>
# <% pkmn_object.write_to(pkmn_object) %>
