rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
config = YAML.load_file("#{rails_root}/config/redis.yml")[Rails.env]

if Rails.env.production?
  require 'redis'
  redis = Redis.new(:host => config[:host], :port => config[:port])
else
  redis = "localhost:6379"
end

Resque.redis = redis
