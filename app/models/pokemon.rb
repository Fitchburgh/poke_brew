require 'json'
require 'httparty'
# require_relative '/Users/Fitchburgh/Documents/TIY/homework/week7/poke_brew/cache/pokemon/name_id'
require 'pry'
# pkmn_name_and_id

poke_list = File.read('cache/pokemon/name_id.json')

# poke_list =

class Pokemon #< ApplicationRecord
  attr_reader :pkmn_name, :pkmn_id, :pkmn_readout
  def initialize(options = {})
    @pkmn_name = options['name']
    @poke_list = JSON.parse(options['list'])
    @pkmn_readout = {}
    @pkmn_id = @poke_list.find { |h| h['name'] == @pkmn_name }
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
      temp_pkmn = get_json("http://pokeapi.co/api/v2/pokemon/#{pkmn_object.pkmn_id['number']}/.json")
      File.open("cache/pokemon/#{@pkmn_name}.json", 'w+') do |f|
        f.write(JSON.parse(temp_pkmn))
        p 'done'
      end
    end
    searched_pkmn = File.read("cache/pokemon/#{@pkmn_name}.json")
    @pkmn_readout = JSON.parse(searched_pkmn) rescue ''
  end
end
 # DELETE ME I need to get the list of pokemon and ID's working.  That is whats broken right now. lets get that and turn this in.

pkmn_object = Pokemon.new('name' => 'zapdos', 'list' => poke_list)
pkmn_object.write_to(pkmn_object)

binding.pry
