redis_url = ENV['REDIS_URL']

Sidekiq.configure_server do |config|
  config.redis = {
    url: redis_url,
    size: 30
  }
end
Sidekiq.configure_client do |config|
  config.redis = {
    url: redis_url,
    size: 1
  }
end
