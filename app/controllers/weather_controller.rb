# frozen_string_literal: true

class WeatherController < ApplicationController
  def index
    @original_address = address_params['address']
    if @original_address.present?
      verifier = MainStreet::AddressVerifier.new(@original_address)
      if verifier.success? && verifier.result.postal_code.present?
        @weather, @cached = CheckWeather.check(verifier.result.postal_code)
        @verified_address = verifier.result.address
      else
        @error_message = verifier.failure_message.present? ? verifier.failure_message : 'Zip code not found'
      end
    end
  end

  private

  def address_params
    params.permit(:address)
  end
end
