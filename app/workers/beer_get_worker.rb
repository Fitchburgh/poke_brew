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

    4.times do
      random = rand(temp_beers['data'].length)
      beers << random
    end

    name = temp_brewery['data']['nameShortDisplay']

    File.open("cache/brewery/#{temp_brewery['data']['nameShortDisplay']}.json", 'w+') do |f|
      f.write([name = { "#{temp_beers['data'][beers[0]]['nameDisplay']}" => temp_beers['data'][beers[0]]['style']['ibuMin'] }, { "#{temp_beers['data'][beers[0]]['nameDisplay']}" => temp_beers['data'][beers[0]]['style']['ibuMax'] }, { "#{temp_beers['data'][beers[1]]['nameDisplay']}" => temp_beers['data'][beers[1]]['style']['ibuMin'] }, { "#{temp_beers['data'][beers[1]]['nameDisplay']}" => temp_beers['data'][beers[1]]['style']['ibuMax'] }, { "#{temp_beers['data'][beers[2]]['nameDisplay']}" => temp_beers['data'][beers[2]]['style']['ibuMin'] }, { 'third_max' => temp_beers['data'][beers[2]]['style']['ibuMax'] }, { "#{temp_beers['data'][beers[3]]['nameDisplay']}" => temp_beers['data'][beers[3]]['style']['ibuMin'] }, { "#{temp_beers['data'][beers[3]]['nameDisplay']}" => temp_beers['data'][beers[3]]['style']['ibuMax'] }]).to_json
    end

    Redis.current.set(name, [{ "#{temp_beers['data'][beers[0]]['nameDisplay']}" => temp_beers['data'][beers[0]]['style']['ibuMin'] }, { "#{temp_beers['data'][beers[0]]['nameDisplay']}" => temp_beers['data'][beers[0]]['style']['ibuMax'] }, { "#{temp_beers['data'][beers[1]]['nameDisplay']}" => temp_beers['data'][beers[1]]['style']['ibuMin'] }, { "#{temp_beers['data'][beers[1]]['nameDisplay']}" => temp_beers['data'][beers[1]]['style']['ibuMax'] }, { "#{temp_beers['data'][beers[2]]['nameDisplay']}" => temp_beers['data'][beers[2]]['style']['ibuMin'] }, { 'third_max' => temp_beers['data'][beers[2]]['style']['ibuMax'] }, { "#{temp_beers['data'][beers[3]]['nameDisplay']}" => temp_beers['data'][beers[3]]['style']['ibuMin'] }, { "#{temp_beers['data'][beers[3]]['nameDisplay']}" => temp_beers['data'][beers[3]]['style']['ibuMax'] }])
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
