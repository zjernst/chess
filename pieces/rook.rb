require_relative 'piece'
require_relative 'movement_module'

class Rook < SlidingPiece
  attr_accessor :current_pos
  include HorizontalMove

  def initialize(color, current_pos)
    super
  end

  def to_s
    " R "
  end

end
