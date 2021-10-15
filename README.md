# README

"Cassie" - short for "Cassandra", not to be confused with CassandraDb. Cursed to know the future, but nobody believes her.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

3.0.2

* System dependencies

Requires an account at https://home.openweathermap.org/ - the free account is pretty liberal with usage, and should do for this.

* Configuration

Copy .env.sample to .env and set OPEN_WEATHER to your Open Weather API key.

* Database creation

postgres

* Database initialization

bundle exec rake db:create
bundle exec rake db:migrate

* How to run the test suite

bundle exec rspec (It's a bit light on specs for my taste, but I didn't have time for a full suite.)

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
