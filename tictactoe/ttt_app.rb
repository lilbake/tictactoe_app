require 'sinatra'
require_relative 'tictactoe_ruby/board_logic.rb'
require_relative 'tictactoe_ruby/ttt_ai_game.rb'
require_relative 'tictactoe_ruby/tictactoe_sai.rb'
require_relative 'tictactoe_ruby/tictactoe_seq_sai.rb'
require_relative 'tictactoe_ruby/human.rb'


enable :sessions

get '/' do 
	erb :choose_player
	
end

post '/input' do 
	session[:player_one] = params[:player_one] 
	session[:player_two] = params[:player_two] 
 	erb :player_one_marker,:locals => {:player_one => session[:player_one], :player_two => session[:player_two]} 
end 

post '/playermarker' do
	player_one_marker = params[:player_one_marker]
	player_two_marker = params[:player_two_marker]

	if player_one_marker == "yes"
		player_one_marker = "X"
		player_two_marker = "O"
	elsif player_one_marker == "no"
		player_two_marker = "X"
		player_one_marker = "O"
	end

	if session[:player_one] == "simple ai"
		player_one = {:player_mode => SimpleAI.new, :marker => player_one_marker}
	elsif session[:player_one] == "sequential ai"
		player_one = {:player_mode => SequentialAI.new, :marker => player_one_marker}
	else
		player_one = {:player_mode => "human", :marker => player_one_marker}
	end

	if session[:player_two] == "simple ai"
		player_two = {:player_mode => SimpleAI.new, :marker => player_two_marker}
	elsif session[:player_two] == "sequential ai"
		player_two = {:player_mode => SequentialAI.new, :marker => player_two_marker}
	else
		player_two = {:player_mode => "human", :marker => player_two_marker}
	end

	session[:player_one] = player_one
	session[:player_two] = player_two
	session[:board] = create_new_board
	session[:current_player] = session[:player_one]
	
erb :play_game,:locals => {:board => session[:board], :player_one_marker => player_one_marker, :player_two_marker => player_two_marker}
end

post '/play_game' do
	if session[:current_player][:player_mode] == "human"
erb :human_game,:locals => {:board => session[:board]}
	else 
	session[:move] = session[:current_player][:player_mode].get_move(session[:board])
redirect '/make_move'
	end
end

get '/make_move' do
	session[:board] = board_update(session[:board], session[:move], session[:current_player][:marker])
	if game_over?(session[:board],session[:current_player][:marker])
		if winning_combos(session[:board],session[:current_player][:marker])
			"You have Won!"
		elsif tie_combos?(session[:board])
			"You have Tied.."
		else
			"Game is Over!" 
	end
	else
		if session[:current_player] == session[:player_one]
			session[:current_player] = session[:player_two]
		else
			session[:current_player] = session[:player_one]
		end 
	erb :play_game, :locals => {:board => session[:board], :player_one_marker => session[:player_one][:marker], :player_two_marker => session[:player_two][:marker]}
	end
end

post '/human_game' do
	session[:move] = params[:move].to_i - 1
	redirect '/make_move'
end
