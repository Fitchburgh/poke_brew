require 'json'
require 'redis'

class PokemonController < ApplicationController
  def index
    
# maybe add weight and how much they can drink or something
  end

  def submit
    redirect_to 'pokemon/index'
  end
end

# <% pkmn_object = Pokemon.new('name' => 'articuno', 'list' => @poke_list)#, 'id_names' => pkmn_name_and_id) %>
# <% pkmn_object.write_to(pkmn_object) %>
