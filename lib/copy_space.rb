# frozen_string_literal: true

require 'json'
require 'httparty'
require 'yaml'

secrets = YAML.load_file('../config/secrets.yml')
gather_key = secrets['gather_town']['api_key']
space_id = secrets['gather_town']['space_id']

def copy_space(space_name, space_id, api_key, reason)
  url = 'https://api.gather.town/api/v2/spaces'
  body = {
    name: space_name,
    sourceSpace: space_id,
    reason: reason,
    settings: {}
  }.compact
  response = HTTParty.post(url, headers: { 'apiKey' => api_key, 'Content-type' => 'Application/json' },
                                body: body.to_json)
  puts response.body
end

copy_space('copy_space', space_id, gather_key, 'Dungeon')

