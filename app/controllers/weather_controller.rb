class WeatherController < ApplicationController
  require 'open-uri'
  require 'json'

  def get_weather
    api_key = "e859138f069c9158ec50a993ee1539df"
  
    if params[:city].present?
      response = fetch_weather_data(params[:city], api_key)
      process_weather_response(response)
    else
      @error_message = "City not provided"
    end
  end
  
  private
  
  def fetch_weather_data(city, api_key)
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric"
    URI.open(url).read
  rescue OpenURI::HTTPError => e
    @error_message = "City not found"
    nil
  end
  
  def process_weather_response(response)
    return unless response.present?
  
    data = JSON.parse(response)
    if data['cod'] == 200
      @temperature = data['main']['temp']
    else
      @error_message = "City not found"
    end
  end  
end
