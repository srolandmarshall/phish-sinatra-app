ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'nokogiri'
require 'open-uri'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
