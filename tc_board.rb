require_relative 'board'
require 'test/unit'

class TestBoard < Test::Unit::TestCase
  
  def test_setup 
    sample=[[true,true],[false,false]]
    assert_equal(sample, Board.new(sample).grid)
    assert_equal(sample.size, Board.new(sample).size)
  end
  
  def test_live
    board = Board.new([[true,true,true],[true,false,true],[true,true,true]])
    assert(board.live?(0,0))
    assert(!board.live?(0,1))
    assert(board.live?(0,2))
    assert(!board.live?(1,0))
    assert(!board.live?(1,1))
    assert(!board.live?(1,2))
    assert(board.live?(2,0))
    assert(!board.live?(2,1))
    assert(board.live?(2,2))
  end
  
  def test_step
    board = Board.new([[true,false,true],[false,true,true],[true,true,false]])
    board.step
    assert_equal([[false,false,true],[false,false,true],[true,true,true]],board.grid)
  end
  
end