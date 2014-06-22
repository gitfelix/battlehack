source 'https://rubygems.org'

gem 'rails', '4.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem 'bootstrap-sass'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'spring',        group: :development
gem 'carrierwave'

gem 'paypal-sdk-adaptivepayments'

gem 'exifr'

gem 'debugger', group: [:development, :test]

gem 'tzinfo-data', platforms: [:mingw, :mswin]

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :test do
  gem 'syntax'
  gem 'factory_girl_rails'
  gem 'email_spec', require: false
  gem "webrat"
end

group :production do
  gem 'pg'
  gem 'cloudcontrol-rails', '0.0.6'
  gem 'rails_12factor'
end