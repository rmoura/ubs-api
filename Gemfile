# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'health_check', '~> 3.0'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'rubocop-rails'
  gem 'fx', '~> 0.5.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Swagger API Documentation
  gem 'open_api-rswag'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
end

# Serializers
gem 'active_model_serializers', '~> 0.10.10'
gem 'kaminari', '~> 1.2.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
