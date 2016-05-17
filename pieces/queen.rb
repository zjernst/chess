require_relative 'piece'
require_relative 'movement_module'

class Queen < SlidingPiece
  include HorizontalMove
  # include DiagonalMove

  def initialize(color, current_pos)
    super
  end




end
