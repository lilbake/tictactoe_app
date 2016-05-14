require_relative "ttt_ai_game.rb"

def print_game_board(array)
	puts "would you like to play tic tac toe?"
	
    array
    puts """
      #{array[0]} | #{array[1]} | #{array[2]}  
     -----------
      #{array[3]} | #{array[4]} | #{array[5]} 
     -----------
      #{array[6]} | #{array[7]} | #{array[8]} """
end
	player_1 = {:player_mode => SimpleAI.new, :marker => "X"}
	player_2 = {:player_mode => SequentialAI.new, :marker => "O"}
	board = create_new_board
	final_board = play_game(player_1, player_2, board)

print_game_board(board)






