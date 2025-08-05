source "https://rubygems.org"

ruby "3.4.3"

gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "money-rails", "~> 1.15.0"
gem "pg", "~> 1.6"
gem "puma", ">= 5.0"
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "factory_bot_rails", "6.5.0"
  gem "faker", "3.5.2"
  gem "rspec-rails", "8.0.1"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "database_cleaner-active_record"
  gem "selenium-webdriver"
end
