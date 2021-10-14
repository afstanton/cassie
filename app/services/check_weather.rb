# frozen_string_literal: true

class CheckWeather
  attr_accessor :client

  def initialize
    @client = OpenWeather::Client.new(api_key: ENV['OPEN_WEATHER'])
  end

  def self.current(zip)
    weather = CheckWeather.new
    weather.client.current_zip(zip)
  end

  def self.check(zip)
    cached = true
    weather = Weather.find_or_initialize_by(zip: zip)
    if weather.data.blank? || weather.updated_at < 30.minutes.ago
      weather.data = current(zip)
      weather.save
      cached = false
    end

    [weather, cached]
  end
end
