# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckWeather do
  let!(:now) { Time.now }
  let!(:past) { now.1.hour.ago }
  let!(:indy_zip) { '46201' }

  it 'can return the current weather by zip code' do

  end

  it 'can check the weather and save it for caching' do

  end

  it 'uses the cache properly' do

  end
end
