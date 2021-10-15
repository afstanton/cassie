# frozen_string_literal: true

class Weather < ApplicationRecord
  include ActiveSupport::NumberHelper

  def temp_f
    k_to_f(data.dig('main', 'temp'))
  end

  def feels_like_f
    k_to_f(data.dig('main', 'feels_like'))
  end

  def high_temp_f
    k_to_f(data.dig('main', 'temp_max'))
  end

  def low_temp_f
    k_to_f(data.dig('main', 'temp_min'))
  end

  def humidity
    data.dig('main', 'humidity')
  end

  def description
    data['weather'][0]['description']
  end

  def icon_uri
    data['weather'][0]['icon_uri']
  end

  # private

  def k_to_f(temp)
    number_to_rounded((((temp.to_f - 273.15) * (9.0 / 5.0)) + 32.0), precision: 2)
  end
end
