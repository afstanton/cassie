# frozen_string_literal: true

Rails.application.routes.draw do
  root 'weather#index'
  post '/', to: 'weather#index', as: 'check_weather'
end
