begin
  require 'factory_bot_rails'
rescue LoadError
end

class MyEngine < ::Rails::Engine
  config.factory_bot.definition_file_paths +=
    [File.expand_path('../factories', __FILE__)] if defined?(FactoryBotRails)
end
