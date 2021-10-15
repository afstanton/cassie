# frozen_string_literal: true

class WeatherController < ApplicationController
  def index
    @original_address = address_params['address']
    return if @original_address.blank?

    verifier = MainStreet::AddressVerifier.new(@original_address)
    if verifier.success? && verifier.result.postal_code.present?
      @weather, @cached = CheckWeather.check(verifier.result.postal_code)
      @verified_address = verifier.result.address
    else
      @error_message = verifier.failure_message.presence || 'Zip code not found'
    end
  end

  private

  def address_params
    params.permit(:address)
  end
end
