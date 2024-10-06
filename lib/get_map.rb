# frozen_string_literal: true

require 'httparty'
require 'uri'
require 'yaml'

# Load keys from YAML file
secrets = YAML.safe_load_file('../config/secrets.yml')

SPACE_ID = secrets['gather_town']['space_id']
API_KEY = secrets['gather_town']['api_key']

url = "https://api.gather.town/api/v2/spaces/#{URI.encode_www_form_component(SPACE_ID)}"

begin
  response = HTTParty.get(url, headers: { 'apiKey' => API_KEY })
  puts response.body
rescue StandardError => e
  puts "Error: #{e.message}"
end
