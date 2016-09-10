require 'httparty'

class Recipe
  include HTTParty

  #debug_output $stderr

  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api/search"
#  key_value = ENV['FOOD2FORK_KEY']
  default_params key: 'fe64ddfb9f30d1ea59a43d2da88699df'
#  default_params key: key_value
  format :json

  def self.for (keyword)
	get("", query: {q: keyword})["recipes"]
  end
end
