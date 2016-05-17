require_relative 'piece'
require 'byebug'
# require_relative Movement

class Bishop < Piece
  include Movement

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
