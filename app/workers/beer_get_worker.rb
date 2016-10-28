require 'sidekiq'
require 'redis'
require 'httparty'
#
class BeerGetWorker
  include Sidekiq::Worker

  def perform(brewery_id)
    p "yes m'Lord?"
    temp_brewery = get_json("http://api.brewerydb.com/v2/brewery/#{brewery_id}?key=3d5211aea4c0cb4c75f7dacac1d6734a")

    name = temp_brewery['data']['nameShortDisplay']

    File.open("cache/brewery/#{temp_brewery['data']['nameShortDisplay']}.json", 'w+') do |f|
      brewery = {}
      f.write(brewery[temp_brewery['data']['name']] = [temp_brewery['data']['nameShortDisplay'], temp_brewery['data']['id']])
    end
    $redis.set(temp_brewery['data']['name'], [temp_brewery['data']['nameShortDisplay'], temp_brewery['data']['id']])
    p 'jobs done'
  end

  def get_json(url)
    HTTParty.get(url).parsed_response
  end
end
