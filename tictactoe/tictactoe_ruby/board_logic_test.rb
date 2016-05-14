require 'minitest/autorun'
require_relative "board_logic.rb"

class TicTacToe < Minitest::Test

	def test_that_game_board_exist
		assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9], create_new_board)
	end

	def test_that_marker_changes_to_X_or_O
		assert_equal([1, 2, 3, "X", 5, 6, 7, 8, 9], board_update([1, 2, 3, 4, 5, 6, 7, 8, 9], 3, "X"))
		assert_equal([1, "O", 3, 4, 5, 6, 7, 8, 9], board_update([1, 2, 3, 4, 5, 6, 7, 8, 9], 1, "O"))
	end

	def test_if_space_is_valid_or_invalid
		assert_equal(false, validity_position?(["O", 2, 3, 4, 5, 6, 7, 8, 9], 0, "O"))
		assert_equal(true, validity_position?(["X", 2, 3, 4, 5, 6, 7, 8, 9], 4, "O"))
	end

	def test_that_combo_wins
		assert_equal(true, winning_combos([1, 2, "X", 4, 5, "X", 7, 8, "X"], "X"))
		assert_equal(true, winning_combos([1, 2, "O", 4, 5, "O", 7, 8, "O"], "O"))
		assert_equal(false, winning_combos([1, 2, 3, "O", 5, "X", 7, 8, "X"], "X"))
		assert_equal(false, winning_combos([1, 2, "X", 4, 5, 6, "X", 8, "X"], "X"))
	end

	def test_if_game_is_a_tie
		assert_equal(true, tie_combos?(["X", "X", "O", "O", "X", "X", "X", "O", "O"]))
		assert_equal(false, tie_combos?([1, 2, "O", 4, 5, "O", 7, 8, "O"]))
	end

	def test_that_the_game_is_finished
		assert_equal(true, game_over?([1, 2, "O", 4, 5, "O", 7, 8, "O"], "O"))
		assert_equal(true, game_over?(["X", "X", "O", "O", "X", "X", "X", "O", "O"], "O"))
		assert_equal(false, game_over?([1, 2, 3, 4, 5, 6, 7, 8, 9], "O"))
	end

	def test_available_spaces
		assert_equal([1, 2, 3], get_available_spaces([1, 2, 3, "O", "O", "X", "X", "X", "O"]))
		assert_equal([], get_available_spaces(["X", "X", "O", "O", "X", "X", "X", "O", "O"]))
	end
end