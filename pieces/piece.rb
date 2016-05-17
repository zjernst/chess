class Piece

  def initialize(color, starting_pos)
    @current_pos = starting_pos
    @color = color

  end

  class InvalidMoveError < RuntimeError

    def initialize
      @message = "Cannot move there"
    end
  end

  def to_s
    " X "
  end
end


class SlidingPiece < Piece
end
