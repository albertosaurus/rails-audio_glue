source "https://rubygems.org"

gem 'audio_glue', :git => 'git@github.com:TMXCredit/audio_glue.git', :branch => '12148_audio_glue'
gem 'rails', '> 3.0'


group :development do
  gem "bundler", "~> 1.0"
  gem "jeweler", "~> 1.8.7"
  gem 'yard'

  gem 'guard-rspec'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry'

  # code metrics:
  gem "metric_fu"
end

group :test do
  gem "rspec", "~> 2.14.1"
  gem "rspec-rails", "~> 2.14.0"
  gem 'simplecov'          , :require => false
  gem 'simplecov-rcov-text', :require => false
  gem 'chromaprint'
end
