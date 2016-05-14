require 'minitest/autorun'
require_relative "tictactoe_sai.rb"

class TicTacToeSimpleAI <Minitest::Test

	def test_last_available_space
		assert_equal(1, get_move([1, "X", "O", "O", "O", "X", "X", "X", "O"]))
		assert_equal(4, get_move(["X", "X", "O", 4, "O", "X", "X", "X", "O"]))
	end

	def test_chooses_multiple_spaces_available
		assert_includes([1, 2, 3], get_move([1, 2, 3, "O", "O", "X", "X", "X", "O"]))
		refute_includes([4, 5, 6], get_move([1, 2, 3, "O", "O", "X", "X", "X", "O"]))
	end



end