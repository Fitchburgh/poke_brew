require 'sidekiq'
require 'redis'
require 'httparty'

class PokeGetWorker
  include Sidekiq::Worker

  def perform(pkmn_id, pkmn_name)

    p "yes m'Lord?"
    temp_pkmn = get_json("http://pokeapi.co/api/v2/pokemon/#{pkmn_id}")
    # File.open("cache/pokemon/#{pkmn_name}/full.json", 'w+') do |f|
    #   f.write(JSON.dump(temp_pkmn))
    File.open("cache/pokemon/#{pkmn_name}.json", 'w+') do |f|
      # f.write(JSON.dump(temp_pkmn))
      pokemon = {}
      f.write(pokemon[pkmn_name] = [temp_pkmn['name'], temp_pkmn['weight'], temp_pkmn['types'].first])
      p 'done'
    end
    $redis.set(pkmn_name, [temp_pkmn['name'], temp_pkmn['weight'], temp_pkmn['types'].first])
    p 'jobs done'
  end

  def get_json(url)
    HTTParty.get(url).parsed_response
  end
end
