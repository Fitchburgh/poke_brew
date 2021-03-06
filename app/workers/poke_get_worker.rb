require 'sidekiq'
require 'redis'
require 'httparty'

#
class PokeGetWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(pkmn_id, pkmn_name)
    p "yes m'Lord?"
    temp_pkmn = get_json("http://pokeapi.co/api/v2/pokemon/#{pkmn_id}")
    # File.open("cache/pokemon/#{pkmn_name}/full.json", 'w+') do |f|
    #   f.write(JSON.dump(temp_pkmn))
    # File.open("cache/pokemon/#{pkmn_name}.json", 'w+') do |f|
    #   pokemon = {}
    #   f.write(pokemon[pkmn_name] = { 'name' => temp_pkmn['name'], 'weight' => temp_pkmn['weight'], 'type' => temp_pkmn['types'].first, 'attacks' => [{'attack_one' => '', 'attack_two' => '', 'attack_three' => '', 'attack_four' => '' }] }.to_json)
    # end
    Redis.current.set(pkmn_name, { 'name' => temp_pkmn['name'], 'weight' => temp_pkmn['weight'], 'type' => temp_pkmn['types'].first, 'attacks' => [{'attack_one' => '', 'attack_two' => '', 'attack_three' => '', 'attack_four' => '' }] }.to_json)
    p 'jobs done'
  end

  def get_json(url)
    HTTParty.get(url).parsed_response
  end
end
