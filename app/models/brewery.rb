require 'json'
require 'httparty'
require 'redis'
require 'sidekiq'
# optional
require 'pry'
#

breweries = { 'Brews' =>
  [
    'Lonerider' => 'd25euF',
    'Raleigh Brewing' => 'ST1lih',
    'Surly' => 'cPRfoj',
    'Gizmo' => 'ehcJKn',
    'Bull City' => 'eu1cAn',
    'Trophy' => '6jDZlV',
    'Fullsteam' => 'HUCz2L',
    'Deep River' => 'bLbQyH',
    'Hi-Wire' => 'ueswRW',
    'Palmetto' => 'Fvb1JY',
    'Big Boss' => 'pwfPCD',
    'Mother Earth' => 'LZ4UuN',
    'Bond Brothers' => 'mEDZEd',
    'Duck Rabbit' => 'rBxNNF'
  ]}
#
class Brewery # < ApplicationRecord
  def initialize(options)
    @name = options
    @brewery_id = ''
  end

  def get_id(breweries)
    @brewery_id = breweries['Brews'].first[@name]
  end


  def name_check
    return true if File.file?("cache/brewery/#{@name}.json")
  end


  def write_to
    if $redis.get(@name) != nil || self.name_check == true
    else
      BeerGetWorker.perform_async(@brewery_id)
    end
  end

  def get_json(url)
    temp = HTTParty.get(url).parsed_response
  end
end

trophy = Brewery.new('Trophy')

trophy.get_id(breweries)
binding.pry
