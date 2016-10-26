class PokemonController < ApplicationController
  def index
    pkmn_object = Pokemon.new('name' => 'zapdos', 'id_names' => pkmn_name_and_id)
    pkmn_object.write_to(pkmn_object)
  end
end
