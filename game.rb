require 'sinatra'

before do
	headers "Content-Type" => "text/html; charset=utf-8"
	@defeat = { rock: :scissors, paper: :rock, scissors: :paper }
	@throws = @defeat.keys
end

get '/' do
	@title = "Rock-paper-scissors!"
	erb :links
end

get '/throw/:type' do
	@player_throw = params[:type].to_sym
	unless @throws.include?(@player_throw)
		halt 403, "You must throw one of the following: #{@throws}"
	end
	erb :result
end