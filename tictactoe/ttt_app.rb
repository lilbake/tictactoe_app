require 'sinatra'
require_relative 'tictactoe_ruby/board_logic.rb'
require_relative 'tictactoe_ruby/ttt_ai_game.rb'
require_relative 'tictactoe_ruby/tictactoe_sai.rb'
require_relative 'tictactoe_ruby/tictactoe_seq_sai.rb'


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

	if session[:player_one] = "simple ai"
		player_one = {:player_mode => SimpleAI.new, :marker => player_one_marker}
		player_two = {:player_mode => SequentialAI.new, :marker => player_two_marker}
	elsif session[:player_one] = "sequential ai"
		player_one = {:player_mode => SequentialAI.new, :marker => player_one_marker}
		player_two = {:player_mode => SimpleAI.new, :marker => player_two_marker}
	end

	
	board = create_new_board
	board = play_game(player_one, player_two, board)

erb :player_marker,:locals => {:player_one_marker => player_one_marker, :player_two_marker => player_two_marker, :board => board}

end
