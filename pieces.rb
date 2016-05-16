class Piece

  class InvalidMoveError < RuntimeError

    def initialize
      @message = "Cannot move there"
    end
  end

  def initialize
  end

  def to_s
    " X "
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

class SlidingPiece < Piece
end

class Rook < SlidingPiece
  attr_accessor :current_pos

  def initialize(color)
    @color = color
    @current_pos = nil
  end

  def possible_moves
    moves = (-7..7).to_a.map do |int|
      [@current_pos[0] + int, @current_pos[1]]
    end
    moves += (-7..7).to_a.map do |int|
      [@current_pos[0], @current_pos[1] + int]
    end
    moves.select { |x,y| x.between?(0,7) && y.between?(0,7) }
  end


end
