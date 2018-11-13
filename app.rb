require 'sinatra'
require_relative 'poker.rb'

get '/' do
erb :poker
end
