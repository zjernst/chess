class Piece

  attr_accessor :current_pos
  attr_reader :board, :color

  DIAGONALS = [[1,1],[-1,-1],[1,-1],[-1,1]]
  RECTILINEAR = [[1,0],[-1,0],[0,1],[0,-1]]

  def initialize(color, starting_pos, board)
    @current_pos = starting_pos
    @color = color
    @board = board
  end

  class InvalidMoveError < RuntimeError

    def initialize
      @message = "Cannot move there"
    end
  end

  def to_s
    " X "
  end

  def out_of_bounds?(pos)
    pos.any? { |x| !x.between?(0, 7) }
  end

  def friendly_piece?(pos)
    board[pos].color == color
  end
end

#
# class SlidingPiece < Piece
# end
