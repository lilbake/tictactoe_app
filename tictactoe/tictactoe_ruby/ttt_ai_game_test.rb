require 'minitest/autorun'
require_relative "ttt_ai_game.rb"

class TicTacToeGame <Minitest::Test

	def test_that_the_game_is_over
		player_1 = {:player_mode => SimpleAI.new, :marker => "X"}
		player_2 = {:player_mode => SequentialAI.new, :marker => "O"}
		board = create_new_board
		final_board = play_game(player_1, player_2, board)
		assert_equal(true, game_over?(final_board, "X") || game_over?(final_board, "O"))
	end

	def test_count
		player_1 = {:player_mode => SimpleAI.new, :marker => "X"}
		player_2 = {:player_mode => SequentialAI.new, :marker => "O"}
		board = create_new_board
		final_board = play_game(player_1, player_2, board)
		remaining_board = get_available_spaces(final_board)
		assert(true, remaining_board.count <=4)
	end

	# def test_that_the_game_has_been_completed
	# 	assert_equal(true, game_over?(["X", "X", "X", "O", 5, "O", 6, "O", 8, 9], "X"))
	# 	assert_equal(false, game_over?([1, 2, 3, 4, 5, 6, 7, 8, "X"], "O"))
	# end

	# def test_that_game_board_exist
	# 	assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9], create_new_board)
	# end

	# def test_that_marker_changes_to_X_or_O
	# 	assert_equal([1, 2, 3, "X", 5, 6, 7, 8, 9], board_update([1, 2, 3, 4, 5, 6, 7, 8, 9], 3, "X"))
	# 	assert_equal([1, "O", 3, 4, 5, 6, 7, 8, 9], board_update([1, 2, 3, 4, 5, 6, 7, 8, 9], 1, "O"))
	# end

	# def test_if_space_is_valid_or_invalid
	# 	assert_equal(false, validity_position?(["O", 2, 3, 4, 5, 6, 7, 8, 9], 0, "O"))
	# 	assert_equal(true, validity_position?(["X", 2, 3, 4, 5, 6, 7, 8, 9], 4, "O"))
	# end

	# def test_that_combo_wins
	# 	assert_equal(true, winning_combos([1, 2, "X", 4, 5, "X", 7, 8, "X"], "X"))
	# 	assert_equal(true, winning_combos([1, 2, "O", 4, 5, "O", 7, 8, "O"], "O"))
	# 	assert_equal(false, winning_combos([1, 2, 3, "O", 5, "X", 7, 8, "X"], "X"))
	# 	assert_equal(false, winning_combos([1, 2, "X", 4, 5, 6, "X", 8, "X"], "X"))
	# end

	# def test_if_game_is_a_tie
	# 	assert_equal(true, tie_combos?(["X", "X", "O", "O", "X", "X", "X", "O", "O"]))
	# 	assert_equal(false, tie_combos?([1, 2, "O", 4, 5, "O", 7, 8, "O"]))
	# end

	# def test_that_the_game_is_finished
	# 	assert_equal(true, game_over?([1, 2, "O", 4, 5, "O", 7, 8, "O"], "O"))
	# 	assert_equal(true, game_over?(["X", "X", "O", "O", "X", "X", "X", "O", "O"], "O"))
	# 	assert_equal(false, game_over?([1, 2, 3, 4, 5, 6, 7, 8, 9], "O"))
	# end

	# def test_available_spaces
	# 	assert_equal([1, 2, 3], get_available_spaces([1, 2, 3, "O", "O", "X", "X", "X", "O"]))
	# 	assert_equal([], get_available_spaces(["X", "X", "O", "O", "X", "X", "X", "O", "O"]))
	# end

	# def test_last_available_space
	# 	assert_equal(1, get_move([1, "X", "O", "O", "O", "X", "X", "X", "O"]))
	# 	assert_equal(4, get_move(["X", "X", "O", 4, "O", "X", "X", "X", "O"]))
	# end

	# def test_chooses_multiple_spaces_available
	# 	assert_includes([1, 2, 3], get_move([1, 2, 3, "O", "O", "X", "X", "X", "O"]))
	# 	refute_includes([4, 5, 6], get_move([1, 2, 3, "O", "O", "X", "X", "X", "O"]))
	# end

	# def test_particular_move_is_made
	# 	assert_equal(2, get_move_seq(["X", 2, 3, 4, 5, 6, 7, 8, 9]))
	# 	assert_equal(4, get_move_seq(["X", "O", "O", 4, "X", 6, 7, 8, 9]))
	# end



end