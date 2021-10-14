# frozen_string_literal: true

class WeatherController < ApplicationController
  def index
    @original_address = address_params['address']
    verifier = MainStreet::AddressVerifier.new(@original_address)
    if verifier.success?
      @weather, @cached = CheckWeather.check(verifier.result.postal_code)
      @verified_address = verifier.result.address
    else
      @error_message = verifier.failure_message
    end
  end

  private

  def address_params
    params.permit(:address)
  end
end
