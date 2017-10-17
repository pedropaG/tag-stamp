require 'dragonfly'
# Configure
Dragonfly.app.configure do
  plugin :imagemagick
  secret "42fd376e1ffc55b772bc69ec38a294791d52f7d39ffd89cf8d817618a7983157"
  url_format "/media/:job/:name"
  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end
# Logger
Dragonfly.logger = Rails.logger
# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware
# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
