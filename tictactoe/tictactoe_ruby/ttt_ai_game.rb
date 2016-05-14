require_relative "tictactoe_sai.rb"
require_relative "tictactoe_seq_sai.rb"

def play_game (current_player, opponent, board)

	move = current_player[:player_mode].get_move(board)
	board = board_update(board, move -1, current_player[:marker])
	if game_over?(board, current_player[:marker])
		board
	else
		play_game(opponent, current_player, board)
	end
end