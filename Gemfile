source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'pry'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'skeleton-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'newrelic_rpm'
gem 'faker'
gem 'devise'
gem 'redcarpet'
gem 'pundit'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'friendly_id'
gem 'simple_form', '2.1.0'
gem "codeclimate-test-reporter", group: :test, require: nil




# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
