require 'net/http'
require 'uri'
require 'json'
require './parser'

class Weather
  def initialize(api_key)
    @api_key = api_key
  end

  def weather_info(locate)
    end_point_url = 'http://api.openweathermap.org/data/2.5/weather'
    request_url = URI.parse (end_point_url + "?q=#{locate},jp&APPID=#{@api_key}")
    response = Net::HTTP.get(request_url)
    json = JSON.parse(response)
    Parser.parse_json(json)
  end
end



