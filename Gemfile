source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"

gem "bootsnap", ">= 1.4.4", require: false
gem "carrierwave", "~> 2.0"
gem "chartkick"
gem "devise"
gem "devise-i18n"
gem "enum_help"
gem "gretel"
gem "groupdate"
gem "jbuilder", "~> 2.7"
gem "jp_prefecture"
gem "kaminari"
gem "mini_magick"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.4"
gem "rails-i18n", "~> 6.0"
gem "ransack"
gem "sass-rails", ">= 6"
gem "tailwindcss-rails"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-byebug"
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data"
