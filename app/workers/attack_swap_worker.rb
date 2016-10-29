require 'sidekiq'
require 'redis'
require 'httparty'

#
class AttackSwapWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform
  end

  def get_json(url)
    HTTParty.get(url).parsed_response
  end
end
