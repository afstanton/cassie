# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckWeather do
  let!(:now) { Time.zone.parse('2021-10-13 21:30:00') }
  let!(:past) { Time.zone.parse('2021-10-13 20:30:00') }
end
