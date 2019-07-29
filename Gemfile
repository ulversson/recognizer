source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "rails", "~> 6.0.0.rc1"
gem "pg"
gem "sass-rails", "~> 5"
gem "webpacker", "~> 4.0"
gem "fast_jsonapi"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap"
gem "seed_migration"
gem "rmagick"
gem "rack-cors"
gem "sidekiq"
gem "image_processing", "~> 1.2"
gem "font_awesome5_rails"
gem "select2-rails"
gem "ed25519"
gem "bcrypt_pbkdf"
group :development, :test do
  gem "pry", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "capistrano"
  gem "capistrano-rails"
  gem "capistrano-rvm"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
