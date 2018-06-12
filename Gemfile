source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '~> 5.1.4'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record // or pg gem

gem 'sqlite3'
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#me
gem 'haml-rails'
gem 'jquery-rails'
gem 'bcrypt', platforms: 'ruby'
gem 'pickadate-rails'
gem 'unobtrusive_flash', '>=3'
gem 'aws-sdk-s3', require: false
gem 'mini_magick'
gem 'figaro'
#gem 'peek'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  #me

  gem 'pry-nav'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry"
  # STILL TO BE OBSERVED
  gem "awesome_print", require:"ap"
  gem 'meta_request'
  gem 'bullet' #use it when you want to kill hydras
  #gem 'newrelic_rpm used to investigate slow pages. Find out about this well
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# me
group :test do
  gem 'fabrication'
  gem 'faker'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'vcr'
end

group :production do
  gem 'rails_12factor'
end