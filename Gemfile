source 'http://rubygems.org'

# Avoids ArgumentError: invalid byte sequence in US-ASCII
# See: http://stackoverflow.com/a/8926881/66771
if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

gem 'rails', '~> 3.0.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', '~> 1.3.3', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

gem 'compass', '~> 0.11.3'
gem 'fancy-buttons', '~> 1.1.1'
gem 'haml', '~> 3.1.1'
gem 'haml_rails', '~> 0.1.0' #for haml generators

gem 'high_voltage', '~> 0.9.4' #static pages

gem 'devise', '~> 1.3.4' #must be required before rails_admin
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git', 
                   :ref => '01a6807e12f97bd614d5d679b149f4d5226afda7'

gem 'choices', '~> 0.2.4' #for configuration

gem 'tanker', '~> 1.1.3' #for IndexTank search

gem 'will_paginate', '~> 2.3.15'

group :development do
  gem 'rspec-rails', '~> 2.6.1'
  gem 'annotate', '~> 2.4.0'

  #For XML parsing, used by lastfm scripts.
  #See: http://stackoverflow.com/a/14072221/66771
  #gem 'nokogiri', '~> 1.4.6'
  gem 'nokogiri', '~> 1.5.4'

  gem 'ruby-debug19', '~> 0.11.6'
  gem 'irbtools', '~> 1.0.4'

  #For querying discogs api
  #gem 'rest-client', '~> 1.6.3'
  #gem 'rest-client', :git => 'git://github.com/archiloque/rest-client.git'
  gem 'rbrainz', '~> 0.5.2'

  #For querying last.fm api
  gem 'rockstar', '~> 0.6.1'

  gem 'yaml_db', '~> 0.2.1' #export and restore database data
  gem 'taps', '~> 0.3.23' #for import/export heroku
end

group :test do
  gem 'rspec', '~> 2.6.0'
  gem 'webrat', '~> 0.7.3'
end
