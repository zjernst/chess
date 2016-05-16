class Piece

  class InvalidMoveError < RuntimeError

    def initialize
      @message = "Cannot move there"
    end
    
  end
end

class NullPiece

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
end
