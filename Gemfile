if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '3.2.13'

group :development do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'pry'
end

group :production do
  gem 'unicorn'
  gem 'pg'
  gem 'newrelic_rpm'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

gem 'devise'
gem 'bootstrap-sass', '~> 2.1.0.0'
gem 'simple_form'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jquery-rails'
gem 'nestful', :git => 'git://github.com/maccman/nestful.git'
gem 'spinjs-rails'
gem 'thin'
gem 'ferrara', :git => 'git://github.com/swanson/ferrara.git'
gem 'draper'
gem 'stamp'
gem 'delayed_job_active_record'

group :test, :development do
  gem "rspec-rails", "~> 2.0"
end

