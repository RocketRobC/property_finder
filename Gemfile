source 'https://rubygems.org'

gem 'rake', ">= 12.3.3"
gem 'hanami', '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'bcrypt'

gem "rack", ">= 2.0.8"

gem 'aws-sdk-s3'

gem 'pg'

gem 'haml'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
