require 'json'
require 'httparty'
require 'redis'
require 'sidekiq'
# optional
require 'pry'
require_relative '../workers/beer_get_worker.rb'
#

breweries = { 'Brews' =>
  [
    'Lonerider' => 'd25euF',
    'Raleigh' => 'ST1lih',
    'Surly' => 'cPRfoj',
    'Gizmo Brew Works' => 'ehcJKn',
    'Bull City Burger' => 'eu1cAn',
    'Trophy' => '6jDZlV',
    'Fullsteam' => 'HUCz2L',
    'Deep River' => 'bLbQyH',
    'Hi-Wire' => 'ueswRW',
    'Palmetto' => 'Fvb1JY',
    'Big Boss' => 'pwfPCD',
    'Mother Earth' => 'LZ4UuN',
    'Bond Brothers' => 'mEDZEd',
    'The Duck-Rabbit Craft' => 'rBxNNF'
  ]}
#
class Brewery # < ApplicationRecord
  def initialize(options = {})
    @name = options['name']
    @brewery_id = options['breweries']['Brews'].first[@name]
  end

  def name_check
    return true if File.file?("cache/brewery/#{@name}.json")
  end


  def write_to(object)
    if  object.name_check == true || Redis.current.get(@name) != nil
    else
      BeerGetWorker.perform_async(@brewery_id)
    end
  end

  def get_json(url)
    temp = HTTParty.get(url).parsed_response
  end
end

trophy = Brewery.new({'name' => 'Trophy', 'breweries' => breweries})
trophy.write_to(trophy)
