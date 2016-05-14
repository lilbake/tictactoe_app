

# has no input amd creates an array
def create_new_board()
	board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

# chooses position and changes to an x
def board_update(board, position, marker)
	board[position] = marker
	board 
end

# test for validity of the space 
def validity_position?(board, position, marker)
	if board[position] == position + 1
		true
	else
		false
	end
end


#check that the x marker is a winner
def winning_combos(board, marker)
	if  board[1] == marker  && board[4] == marker && board[7] == marker ||
		board[2] == marker  && board[5] == marker && board[8] == marker ||
		board[0] == marker  && board[1] == marker && board[2] == marker ||
		board[3] == marker  && board[4] == marker && board[5] == marker ||
		board[6] == marker  && board[7] == marker && board[8] == marker ||
		board[0] == marker  && board[4] == marker && board[8] == marker ||
		board[2] == marker  && board[4] == marker && board[6] == marker ||
		board[0] == marker  && board[3] == marker && board[6] == marker 
		true
	else
		false
	end
end

def tie_combos?(board)
board.all? do |value|
	value.class == String
	end
end
	
def game_over?(board, marker)
	winning_combos(board, marker) || tie_combos?(board)
end
	
def get_available_spaces(board)
available_spaces = []
	board.each do |value|
		if value.is_a?(Fixnum)
			available_spaces << value
		end
	end
	available_spaces
end