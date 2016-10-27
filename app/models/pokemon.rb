require 'json'
require 'httparty'
# require_relative '/Users/Fitchburgh/Documents/TIY/homework/week7/poke_brew/cache/pokemon/name_id'
# require 'pry'
# pkmn_name_and_id



class Pokemon# < ApplicationRecord
  attr_reader :pkmn_name, :pkmn_id, :pkmn_readout
  def initialize(options = {})
    @pkmn_name = options['name']

    all_pokemon = (options['list']['http://pokeapi.co/api/v2/pokedex/kanto']['pokemon_entries'])
    pkmn_base = all_pokemon.find { |h| h['pokemon_species']['name'] == @pkmn_name }

    @pkmn_id = pkmn_base['entry_number']
    @pkmn_readout = {}
  end

  def get_json(url)
    HTTParty.get(url).parsed_response
  end

  def name_check
    return true if File.file?("cache/pokemon/#{@pkmn_name}.json")
  end

  def write_to(pkmn_object)
    if pkmn_object.name_check == true
      puts "Generating details...\n\n\n"
    else
      temp_pkmn = get_json("http://pokeapi.co/api/v2/pokemon/#{pkmn_object.pkmn_id}/.json")
      File.open("cache/pokemon/#{@pkmn_name}.json", 'w+') do |f|
        f.write(JSON.dump(temp_pkmn))
        p 'done'
      end
    end
    searched_pkmn = File.read("cache/pokemon/#{@pkmn_name}.json").to_json
    @pkmn_readout = JSON.parse(searched_pkmn) rescue ''
  end
end

# pkmn_object = Pokemon.new('name' => 'moltres', 'list' => poke_list)
# pkmn_object.write_to(pkmn_object)
