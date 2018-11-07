require 'sinatra'
require_relative 'poker.rb'
enable :sessions

get '/' do
  'Hello world'
end