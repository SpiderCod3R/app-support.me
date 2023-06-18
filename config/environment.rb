# Load the Rails application.
require_relative "application"

ENV['RAILS_RELATIVE_URL_ROOT'] ||= '/api-suporte.me'
BASE_ROOT_URL = ENV['RAILS_RELATIVE_URL_ROOT']

# Initialize the Rails application.
Rails.application.initialize!
