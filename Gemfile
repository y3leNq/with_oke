source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.5"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# User authentication
gem "sorcery"

# Preview emails
gem "letter_opener_web"
gem "config"

# Paginator
gem "kaminari"

# Search
gem "ransack"

# Internationalization (i18n)
gem "rails-i18n"
gem "enum_help"

# CSS framework
gem "bootstrap"
gem "jquery-rails"

# Create charts
gem "chartkick"

# Auto-generate schema and route
gem "annotate"

# N+1 query
gem "bullet"

# Search information about iTunes content
gem "itunes-search-api"

# Bootstrap-styled forms
gem "bootstrap_form"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Testing frameworks
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Replaces error page
  gem "better_errors"
  gem "binding_of_caller"

  # Code analyzer
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
end

group :test do
  gem "capybara"
  gem "webdrivers"
end
