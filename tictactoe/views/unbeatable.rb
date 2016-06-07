require_relative 'tictactoe_ruby\board_logic.rb'

class Perfect

	def game_board()
	 board_array = %w[1 2 3 4 5 6 7 8 9]
	end

	#center position move
	def center(board, index)
		if board[4] = index + 1
			true
		else 
			false
		end
	end

	#corner position move
	def corner(board, index)
		if board[0] = index + 1 || board[2] = index + 1 || board[6] = index + 1 || board[8] = index + 1
			true
		else
			false
		end
	end

	#edge position move
	def edge(board, index)
		if board[1] = index + 1 || board[3] = index + 1 || board[5] = index + 1 || board[7] = index + 1
			true
		else
			false
		end
	end

	#determining whether the first move is made or not
	def first_move(board)
	board.all? do |value|
	value.class = Fixnum
		end
	end

	#if first move available use a corner space
	def corner_first(board, marker)
		if first_move == true
			board[0] = marker
		else
			false
		end
	end

	#determine second move to make 
	def second_move() 
		if first_move == false && board[4].class = Fixnum
			board[4] = marker
		else
			corner
		end
	end

	def existing_board(board, index, marker)
		board[index] = marker
		board
	end

	#a move made for unbeatable ai
	def perfect_move(marker, index)
		if board[index] == perfect_move
			board[index] = marker
	end

	#final moves in order to win
	def win(board, marker)
		#horizontal top
		if board[0] && board[1] == marker
			board[2] == perfect_move
		elsif board[0] && board[2] == marker
			board[1] == perfect_move
		elsif board[1] && board[2] == marker
			board[0] == perfect_move
		#horiz middle
		elsif board[3] && board[4] == marker
			board[5] == perfect_move
		elsif board[3] && board[5] == marker
			board[4] == perfect_move
		elsif board[4] && board[5] == marker
			board[3] == perfect_move
		#horiz bottom
		elsif board[6] && board[7] == marker
			board[8] == perfect_move
		elsif board[6] && board[8] == marker
			board[7] == perfect_move
		elsif board[7] && board[8] == marker
			board[6] == perfect_move
		#vertical left
		elsif board[0] && board[3] == marker
			board[6] == perfect_move
		elsif board[3] && board[6] == marker
			board[0] == perfect_move
		elsif board[0] && board[6] == marker
			board[3] == perfect_move
		#vert middle
		elsif board[1] && board[4] == marker
			board[7] == perfect_move
		elsif board[1] && board[7] == marker
			board[4] == perfect_move
		elsif board[4] && board[7] == marker
			board[1] == perfect_move
		#vert right
		elsif board[2] && board[5] == marker
			board[8] == perfect_move
		elsif board[2] && board[8] == marker
			board[5] == perfect_move
		elsif board[5] && board[8] == marker
			board[2] == perfect_move
		#diaginal top left 
		elsif board[0] && board[4] == marker
			board[8] == perfect_move
		elsif board[0] && board[8] == marker
			board[4] == perfect_move
		elsif board[4] && board[8] == marker
			board[0] == perfect_move
		#diag bottom left
		elsif board[2] && board[4] == marker
			board[6] == perfect_move
		elsif board[2] && board[6] == marker
			board[4] == perfect_move
		elsif board[4] && board[6] == marker
			board[2] == perfect_move
		else

		end
	end

	#blocks an opponent from making the winning move
	def block(human, marker, index)
		if human[marker] == win
			board[index] = perfect_move
			true
		else
			false
		end
	end

	def fork()
	end

	def fork_block()
	end

	def opposite_corner()
	end

	def empty_corner()
	end

	def empty_side()
	end

end