# require_relative 'piece'
# require_relative SlidingMovement

class Rook < Piece
  include SlidingMovement

  attr_accessor :current_pos

  def initialize(color, current_pos, board)
    @deltas = RECTILINEAR
    super
  end

  def to_s
    " R "
  end

end
