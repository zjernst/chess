require_relative 'manifest'

class Chess
  POSITIONS = {
    "rook" => [[0,0], [0,7], [7,0],[7,7]],
    "bishop" => [[0,2], [0,5], [7,2],[7,5]],
    "knight" => [[0,1], [0,6], [7,1],[7,6]],
    "queen" => [[0,4], [7,3]],
    "king" =>  [[0,3], [7,4]]
    }
  CLASSES = {
    "rook" => Rook,
    "bishop" => Bishop,
    "knight" => Knight,
    "queen" => Queen,
    "king" => King
  }

  attr_reader :board, :player_w, :player_b

  def initialize
    @player_w = Player.new("White", :white)
    @player_b = Player.new("Black", :black)
    @board = setup
  end

  def setup
    board = Board.new
    pawn_setup(board)
    piece_setup(board)

    board

  end

  def piece_setup(board)
    CLASSES.each do |piece, type|
      POSITIONS[piece].each do |position|
        color = position[0] == 0 ? :black : :white
        current_piece = type.new(color, position, board)
        board[position] = current_piece
        if color == :white
          @player_w.pieces << current_piece
        else
          @player_b.pieces << current_piece
        end
      end
    end
  end

  def pawn_setup(board)
    [1,6].each do |x|
      color = x == 6 ? :white : :black
      board.grid[x].map!.with_index { |_, y| Pawn.new(color, [x ,y], board) }
    end
    board
  end
end
