require 'json'
require 'httparty'
require 'redis'
# require_relative 'workers/poke_get_worker.rb'

class Pokemon
  attr_reader :pkmn_name, :pkmn_id, :pkmn_readout

  def initialize(options = {})
    @pkmn_name = options['name']
    @poke_list = JSON.parse(File.read('cache/pokemon/pokemon.json'))
    $all_pokemon = @poke_list['http://pokeapi.co/api/v2/pokedex/kanto']['pokemon_entries']
    pkmn_base = $all_pokemon.find { |h| h['pokemon_species']['name'] == @pkmn_name }
    @pkmn_id = pkmn_base['entry_number']
    @pkmn_readout = {}
  end

  def name_check
    return true if File.file?("cache/pokemon/#{@pkmn_name}.json")
  end

  def write_to(pkmn_object)
    if pkmn_object.name_check == true || Redis.current.get(@pkmn_name) != nil
    else
      PokeGetWorker.perform_async(@pkmn_id, @pkmn_name)
    end

    @pkmn_readout = Redis.current.get(@pkmn_name)
    @pkmn_readout =
      File.read("cache/pokemon/#{@pkmn_name}.json") if @pkmn_readout == {}
  end
end


# <% pkmn_object = Pokemon.new('name' => 'zubat', 'list' => @poke_list)#, 'id_names' => pkmn_name_and_id) %>
# <% pkmn_object = pkmn_object.write_to(pkmn_object) %>
#
# <% brewery_object = Brewery.new({'name' => 'DuClaw'}) %>
# <% brewery_object = brewery_object.write_to(brewery_object) %>
