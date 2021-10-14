# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckWeather do
  let!(:now) { Time.now }
  let!(:past) { now - 1.hour }
  let!(:indy_zip) { '46201' }

  it 'can return the current weather by zip code' do
    VCR.use_cassette(indy_zip) do
      data = CheckWeather.current(indy_zip)

      expect(Weather.all.count).to eq(0)
    end
  end

  it 'can check the weather and save it for caching' do

  end

  it 'uses the cache properly' do

  end
end
