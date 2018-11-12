require 'sinatra'
require_relative 'poker.rb'
enable :sessions

get '/' do
  erb :poker
end

post '/game' do
# game = Rules.new
# game = game.play_game()
# erb :poker, locals:{game: game}
end