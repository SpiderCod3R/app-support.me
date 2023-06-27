source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.0.5"
gem 'mongoid', '~> 8.0.3'
gem "puma", "~> 5.0"

# gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
# gem "redis", "~> 4.0"

# gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "rack-cors"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # gem "spring"
  gem 'pry-rails'
end

gem 'cpf_cnpj'
gem "active_model_serializers"

gem 'jwt', '~> 2.2', '>= 2.2.3'
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'devise_token_auth', '~> 1.2'
gem 'mongoid-locker', '~> 2.0', '>= 2.0.2'
gem 'devise-i18n', '~> 1.11'