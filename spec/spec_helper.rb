require 'hi_httparty'
require 'rspec'
require 'pry'
require 'json'
require 'dotenv'
require 'factory_bot'
require 'faker'

include HiHttparty::RequestsType
HiHttparty.configure do |config_hihttparty|
    config_hihttparty.timeout_value = 10
end

include FactoryBot::Syntax::Methods
FactoryBot.definition_file_paths = %w(./spec/support/factories)
FactoryBot.find_definitions

$env = YAML.load_file('./spec/support/environment.yml')

