require 'singleton'

class NullPiece

  include Singleton

  class InvalidMoveError < RuntimeError
    def initialize
      @message = "That's an empty square."
    end
  end

  def to_s
    "   "
  end

  def valid_move?
    raise InvalidMoveError.new
  end

  def color
    #duck typing
  end

  def current_pos=(pos)
    #ducks on ducks
  end
end
