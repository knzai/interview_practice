#!/usr/bin/env ruby
require 'test/unit'

# Tic Tac Toe

# Implement a simulated Tic-tac-toe game that is played between two players on a 3 x 3 grid.
 
# You may assume the following rules:
 
# There are two players that play against each other X and O.
# X will always go first.
 
# X and O should play randomly, always making valid moves. X will always go first.
# After X and O play a move, the board state should be printed out like so.
 
# |X| | |
# | | | |
# | | | |
 
# |X| |O|
# | | | |
# | | | |

# If the game ends, the simulation should stop and print out the result.

# Possible results are: X Wins!, O Wins!, Draw

class TicTacToError < StandardError; end

class InvalidMoveError < TicTacToError; end
class OutOfBoundMoveError < InvalidMoveError; end
class OccupiedMoveError < InvalidMoveError; end
class InvalidPlayerError < InvalidMoveError; end

class InvalidBoardError < TicTacToError; end

class Board
  attr_accessor :data

  def initialize(data=[nil, nil, nil, nil, nil, nil, nil, nil, nil])
    raise InvalidBoardError unless data.length == 9
    self.data=data
  end

  def rows
    data.each_slice(3).to_a
  end

  def rows=(arrays)
    self.data = arrays.flatten
  end

  def move(x, y, player)
    raise OutOfBoundMoveError, "invalid move" unless (0..2).include?(x) && (0..2).include?(y)
    raise InvalidPlayerError, "invalid move" unless [:x, :y].include?(player)
    i = index x, y
    raise OccupiedMoveError, "invalid move" unless self.data[i].nil?
    data[i] = player
  end

  def valid_moves
    data.each_with_index.filter_map { |player, i| coords(i) if player.nil?}
  end

  def finished?
    valid_moves.empty?
  end

  #TODO
  def won

  end


  private

  def index(x, y)
    y * 3 + x
  end

  def coords(i)
    [i % 3, i / 3]
  end
end

class BoardTest < Test::Unit::TestCase
  def test_board_state
    board = Board.new
    assert_equal([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]], board.rows)
    board.move(0, 1, :x)
    assert_equal([[nil, nil, nil], [:x, nil, nil], [nil, nil, nil]], board.rows)
    assert_raises OutOfBoundMoveError do
      board.move(0, 4, :x)
    end
    assert_raises OccupiedMoveError do
      board.move(0, 1, :x)
    end
    assert_raises InvalidPlayerError do
      board.move(0, 2, :X)
    end
  end

  def test_board_finished
    board = Board.new
    assert_false board.finished?
    board.rows = [[:x, :x, :x], [:x, :x, :x], [:x, :x, :x]]
    assert board.finished?
  end

  def test_valid_moves
    board = Board.new
    assert_equal board.valid_moves.count, 9
    board.rows = [[:x, nil, :x], [:x, :x, :x], [:x, :x, :x]]
    assert_equal board.valid_moves, [[1,0]]
  end
end