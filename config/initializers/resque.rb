rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
config = YAML.load_file("#{rails_root}/config/resque.yml")[Rails.env]

Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == config['user'] && password == config['password']
end
