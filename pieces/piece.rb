class Piece

  attr_reader :color, :current_pos
  attr_accessor :board

  DIAGONALS = [[1,1],[-1,-1],[1,-1],[-1,1]]
  RECTILINEAR = [[1,0],[-1,0],[0,1],[0,-1]]

  def initialize(color, starting_pos, board)
    @current_pos = starting_pos
    @color = color
    @board = board
    @first_move = true
  end

  class InvalidMoveError < RuntimeError

    def initialize
      @message = "Cannot move there"
    end
  end

  def current_pos=(new_pos)
    @current_pos = new_pos
    @first_move = false
  end

  def to_s
    " X "
  end

  def out_of_bounds?(pos)
    pos.any? { |x| !x.between?(0, 7) }
  end

  def friendly_piece?(pos)
    board[pos].color == color unless board.empty?(pos)
  end

  def bad_move?(pos)
    friendly_piece?(pos) || out_of_bounds?(pos)
  end

  def enemy_piece?(pos)
    board[pos].color != color unless board.empty?(pos)
  end
end

#
# class SlidingPiece < Piece
# end
