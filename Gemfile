source 'https://rubygems.org'


ruby "2.3.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bootstrap-sass', '3.3.7'

# Use jquery as the JavaScript library
gem 'jquery-rails'
#User jquery-turbolinks to write JS-Code in a normal way
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Resolving TZInfo::DataSourceNotFound Errors --> https://github.com/tzinfo/tzinfo/wiki/Resolving-TZInfo::DataSourceNotFound-Errors
gem 'tzinfo-data'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'devise'

gem 'cancancan', '~> 1.10'

gem 'will_paginate', '~> 3.1.0'

gem 'date_validator'
gem 'validates_zipcode'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Websocket https://github.com/websocket-rails/websocket-rails
gem 'websocket-rails'
gem 'faye-websocket', '0.10.0' # --> https://github.com/websocket-rails/websocket-rails/issues/424

#Simple Messaging System
gem 'toastr-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem "rails-erd"
end

#Heroku Gems
group :production do
  gem 'rails_12factor'
end

