source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# api engine
gem 'grape', '~> 0.13.0'

# api documentation
gem 'grape-swagger', '~> 0.10.0'
gem 'grape-swagger-rails', '~> 0.1.0'

# CORS Support
gem 'rack-cors', :require => 'rack/cors'

# disables the security feature of strong_params at the model layer,
#allowing you the use of Grape's own params validation instead
gem "hashie-forbidden_attributes"

gem 'active_model_serializers'

# required by the models
gem "activerecord-enum-without-methods", "~>1.0.0"
gem 'date_validator'

gem 'annotate'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.1.0'

  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
