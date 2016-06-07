require_relative 'board_logic.rb'

class Human

	def get_move(board)
		human_choice = get_available_spaces(board)
		human_choice = board_update(board, position, marker)
	end

end