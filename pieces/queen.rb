# require_relative 'piece'
# require_relative Movement

class Queen < Piece
  include Movement

  def initialize(color, current_pos, board)
    super
    @deltas = DIAGONALS + RECTILINEAR
  end




end
