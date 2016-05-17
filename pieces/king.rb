class King < Piece
  include SteppingMovement
  def initialize(color, current_pos, board)
    super
    @deltas = DIAGONALS + RECTILINEAR
  end
end
