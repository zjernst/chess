require_relative 'piece'
require 'byebug'
# require_relative SlidingMovement

class Bishop < Piece
  include SlidingMovement

  attr_accessor :current_pos
  # include DiagonalMove


  def initialize(color, current_pos, board)
    @deltas = Piece::DIAGONALS
    super
  end

  def to_s
    " B "
  end

end
