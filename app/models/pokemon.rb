require 'json'
require 'httparty'
require 'redis'
# require_relative '/Users/Fitchburgh/Documents/TIY/homework/week7/poke_brew/cache/pokemon/name_id'
require 'pry'
# pkmn_name_and_id
class Pokemon# < ApplicationRecord
  attr_reader :pkmn_name, :pkmn_id, :pkmn_readout

  def initialize(options = {})
    @poke_list = JSON.parse(File.read('cache/pokemon/pokemon.json'))
    #pkmn_object = Pokemon.new('name' => 'moltres', 'list' => poke_list)

    @pkmn_name = options['name']
    all_pokemon = @poke_list['http://pokeapi.co/api/v2/pokedex/kanto']['pokemon_entries']
    pkmn_base = all_pokemon.find { |h| h['pokemon_species']['name'] == @pkmn_name }

    @pkmn_id = pkmn_base['entry_number']
    @pkmn_readout = {}
  end

  # def get_json(url)
  #   HTTParty.get(url).parsed_response
  # end

  def name_check
    return true if File.file?("cache/pokemon/#{@pkmn_name}.json")
  end

  def write_to(pkmn_object)
    if pkmn_object.name_check == true || $redis.get(@pkmn_name) != nil
      puts "Generating details...\n\n\n"
    else
      PokeGetWorker.perform_async(@pkmn_id, @pkmn_name)
      # temp_pkmn = get_json("http://pokeapi.co/api/v2/pokemon/#{temp_id}/.json")
      # File.open("cache/pokemon/#{@pkmn_name}.json", 'w+') do |f|
      #   f.write(JSON.dump(temp_pkmn))
      #   p 'done'
      # end
    end
    # @pkmn_readout = $redis.get(@pkmn_name)
    if @pkmn_readout == {}
      @pkmn_readout = File.read("cache/pokemon/#{@pkmn_name}.json")
    end
  end
end
# pkmn_object.write_to(pkmn_object)
