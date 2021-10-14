# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckWeather do
  let!(:indy_zip) { '46201' }

  it 'can return the current weather by zip code' do
    VCR.use_cassette(indy_zip) do
      _data = described_class.current(indy_zip)

      expect(Weather.all.count).to eq(0)
    end
  end

  it 'can check the weather and save it for caching' do
    VCR.use_cassette(indy_zip) do
      _data, cached = described_class.check(indy_zip)

      expect(Weather.all.count).to eq(1)
      expect(cached).to be_falsey
    end
  end

  it 'uses the cache properly' do
    VCR.use_cassette(indy_zip, allow_playback_repeats: true) do
      _data, cached = described_class.check(indy_zip)

      expect(Weather.all.count).to eq(1)
      expect(cached).to be_falsey

      _data, cached = described_class.check(indy_zip)

      expect(Weather.all.count).to eq(1)
      expect(cached).to be_truthy

      weather = Weather.last
      weather.updated_at = 1.hour.ago
      weather.save

      _data, cached = described_class.check(indy_zip)

      expect(Weather.all.count).to eq(1)
      expect(cached).to be_falsey
    end
  end
end
