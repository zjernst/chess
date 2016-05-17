require_relative 'piece'
require_relative 'movement_module'

class Bishop < SlidingPiece
  attr_accessor :current_pos
  include DiagonalMove


  def initialize(color, current_pos)
    super
  end

  def to_s
    " B "
  end

end
