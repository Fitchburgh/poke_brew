require 'json'
require 'httparty'
require 'redis'
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
    'The Duck-Rabbit Craft' => 'rBxNNF',
    'Anderson Valley' => 'L2dAEr',
    'Cisco Brewers' => 'r5kixF', #haunter
    'Westbrook' => 'HPfwPW', #raichu
    'DuClaw' => 'TVgBWg', #Ninetails
    'Jailbreak' => 'cT18w8', #Dragonair
    'New Belgium' => 'Jt43j7', #arcanine
    'Cigar City' => 'EYuZg3' #charmander
  ]}
#
class Brewery # < ApplicationRecord
  attr_reader :name, :brewery_id, :brewery_readout
  def initialize(options = {})
    @name = options['name']
    @brewery_id = options['breweries']['Brews'].first[@name]
    @brewery_readout = {}
  end

  def name_check
    return true if File.file?("cache/brewery/#{@name}.json")
  end

  def write_to(object)
    if  object.name_check == true || Redis.current.get(@name) != nil
      p 'in if'
    else
      BeerGetWorker.perform_async(@brewery_id)
      p 'in else'
    end
    @brewery_readout = Redis.current.get(@name)
    @brewery_readout = File.read("cache/brewery/#{name}.json") if @brewery_readout == {}
  end
end

trophy = Brewery.new({'name' => 'Trophy', 'breweries' => breweries})
trophy.write_to(trophy)
