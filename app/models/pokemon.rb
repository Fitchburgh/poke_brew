require 'json'
require 'httparty'
require 'pry'
#/Users/Fitchburgh/Documents/TIY/homework/week7/poke_brew

pkmn_name_and_id = JSON.parse(JSON.parse(File.read('cache/pokemon/name_id.json')))

class Pokemon #< ApplicationRecord
  attr_reader :pkmn_name, :pkmn_id
  def initialize(options = {})
    @pkmn_name = options['name']
    @pkmn_readout = {}
    @pkmn_id = options['id_names'].find { |h| h['name'] == @pkmn_name }
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
        f.write(JSON.pretty_generate(temp_pkmn))
        p 'done'
      end
    end
    searched_pkmn = File.read("cache/pokemon/#{@pkmn_name}.json")
    @pkmn_readout = JSON.parse(searched_pkmn)
  end
end
