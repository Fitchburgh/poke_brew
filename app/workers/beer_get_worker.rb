require 'sidekiq'
require 'redis'
require 'httparty'
# optional
require 'pry'
#
class BeerGetWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(brewery_id)
    p "yes m'Lord?"
    temp_brewery = get_json("http://api.brewerydb.com/v2/brewery/#{brewery_id}?key=3d5211aea4c0cb4c75f7dacac1d6734a")
    temp_beers = get_json("http://api.brewerydb.com/v2/brewery/#{brewery_id}/beers?key=3d5211aea4c0cb4c75f7dacac1d6734a")
    beers = []

    10.times do
      random = rand(temp_beers['data'].length)
      beers << random
      beers.uniq
    end

    brewery = temp_brewery['data']['nameShortDisplay']

    File.open("cache/brewery/#{temp_brewery['data']['nameShortDisplay']}.json", 'w+') do |f|
      f.write(brewery = { 'name' => "#{temp_brewery['data']['nameShortDisplay']}", 'attacks' => [{ "#{temp_beers['data'][beers[0]]['nameDisplay']}" => [temp_beers['data'][beers[0]]['style']['ibuMin'], temp_beers['data'][beers[0]]['style']['ibuMax'], temp_beers['data'][beers[0]]['abv']] }, { "#{temp_beers['data'][beers[1]]['nameDisplay']}" => [temp_beers['data'][beers[1]]['style']['ibuMin'], temp_beers['data'][beers[1]]['style']['ibuMax'], temp_beers['data'][beers[1]]['abv']] }, { "#{temp_beers['data'][beers[2]]['nameDisplay']}" => [temp_beers['data'][beers[2]]['style']['ibuMin'], temp_beers['data'][beers[2]]['style']['ibuMax'], temp_beers['data'][beers[2]]['abv']] }, { "#{temp_beers['data'][beers[3]]['nameDisplay']}" => [temp_beers['data'][beers[3]]['style']['ibuMin'], temp_beers['data'][beers[3]]['style']['ibuMax'], temp_beers['data'][beers[3]]['abv']] }] }).to_json
    end

    Redis.current.set("#{temp_brewery['data']['nameShortDisplay']}", { 'name' => "#{temp_brewery['data']['nameShortDisplay']}", 'attacks' => [{ "#{temp_beers['data'][beers[0]]['nameDisplay']}" => [temp_beers['data'][beers[0]]['style']['ibuMin'], temp_beers['data'][beers[0]]['style']['ibuMax'], temp_beers['data'][beers[0]]['abv']] }, { "#{temp_beers['data'][beers[1]]['nameDisplay']}" => [temp_beers['data'][beers[1]]['style']['ibuMin'], temp_beers['data'][beers[1]]['style']['ibuMax'], temp_beers['data'][beers[1]]['abv']] }, { "#{temp_beers['data'][beers[2]]['nameDisplay']}" => [temp_beers['data'][beers[2]]['style']['ibuMin'], temp_beers['data'][beers[2]]['style']['ibuMax'], temp_beers['data'][beers[2]]['abv']] }, { "#{temp_beers['data'][beers[3]]['nameDisplay']}" => [temp_beers['data'][beers[3]]['style']['ibuMin'], temp_beers['data'][beers[3]]['style']['ibuMax'], temp_beers['data'][beers[3]]['abv']] }] })
    p 'jobs done'
  end

  def get_json(url)
    HTTParty.get(url).parsed_response
  end
end

# Calculator:
#  -weight of pkmn
#  -abv%
#  -12oz serving size
#  -beer serving number
#  -60 minutes
