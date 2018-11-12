require 'sinatra'
require_relative 'poker.rb'
enable :sessions

get '/' do
 
erb :poker
end

post '/game' do


end