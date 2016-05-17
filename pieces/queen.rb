# require_relative 'piece'
# require_relative SlidingMovement

class Queen < Piece
  include SlidingMovement

  def initialize(color, current_pos, board)
    super
    @deltas = DIAGONALS + RECTILINEAR
  end

  def to_s
    " Q "
  end
end
