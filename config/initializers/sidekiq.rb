# Sidekiq.configure_server do |config|
#   config.redis = { url: "redis://h:p6aj2b0cu38e4eeuan9b044rt96@ec2-54-221-211-164.compute-1.amazonaws.com:17009" }
# end
#
# Sidekiq.configure_client do |config|
#   config.redis = { url: "redis://h:p6aj2b0cu38e4eeuan9b044rt96@ec2-54-221-211-164.compute-1.amazonaws.com:17009" }
# end

development:
  :concurrency: 5
production:
  :concurrency: 20
:queues:
  - default
