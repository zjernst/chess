# require_relative 'piece'
# require_relative Movement

class Rook < Piece
  include Movement

  attr_accessor :current_pos

  def initialize(color, current_pos, board)
    @deltas = RECTILINEAR
    super
  end

  def to_s
    " R "
  end

end
