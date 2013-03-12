require 'sinatra'

before do
	@defeat = { rock: :scissors, paper: :rock, scissors: :paper }
	@throws = @defeat.keys
end

get '/' do
	erb :index
end

get '/throw/:type' do
	player_throw = params[:type].to_sym

	unless @throws.inlude?(player_throw)
		halt 403, "You must throw one of the followinf: #{@throws}"
	end

	computer_throw = @throws.sample

	if player_throw == computer_throw
		"You tied with the computer. Try again!"
	elsif computer_throw == @defeat[player_throw]
		"Nicely done! #{player_throw} beats #{computer_throw}!"
	else
		"Ouch! #{computer_throw} beats #{player_throw} ... Better luck next time!"
	end
end

not_found do
	halt 404, "Whoops! Error 404"
end