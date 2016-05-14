require 'minitest/autorun'
require_relative "tictactoe_seq_sai.rb"

class TicTacToeAI2 <Minitest::Test

	def test_particular_move_is_made
		assert_equal(2, get_move(["X", 2, 3, 4, 5, 6, 7, 8, 9]))
		assert_equal(4, get_move(["X", "O", "O", 4, "X", 6, 7, 8, 9]))
	end



end
