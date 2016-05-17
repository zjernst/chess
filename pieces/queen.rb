require_relative 'piece'
require_relative 'movement_module'

class Queen < SlidingPiece
  DELTA = DIAGONALS + RECTILINEAR
  include 'movement'

  def initialize(color, current_pos)
    super
  end




end
