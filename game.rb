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

  attr_reader :board
  
  def initialize
    @board = setup
  end

  def setup
    board = Board.new
    pawn_setup(board)
    piece_setup(board)
    # rook_setup(board)
    # knight_setup(board)
    # bishop_setup(board)
    # queen_setup(board)
    # king_setup(board)
    board
    #everything else setup
  end

  def piece_setup(board)
    CLASSES.each do |piece, type|
      positions = POSITIONS[piece]
      positions.each do |position|
        color = position[0] == 0 ? :black : :white
        board[position] = type.new(color, position, board)
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

  def rook_setup(board)
    positions = [[0,0], [0,7], [7,0],[7,7]]

    positions.each do |position|
      color = position[0] == 0 ? :black : :white
      board[position] = Rook.new(color, position, board)
    end
    board
  end

  def knight_setup(board)
    positions = [[0,1], [0,6], [7,1],[7,6]]

    positions.each do |position|
      color = position[0] == 0 ? :black : :white
      board[position] = Knight.new(color, position, board)
    end
    board
  end

  def bishop_setup(board)
    positions = [[0,2], [0,5], [7,2],[7,5]]

    positions.each do |position|
      color = position[0] == 0 ? :black : :white
      board[position] = Bishop.new(color, position, board)
    end
    board
  end

  def queen_setup(board)
    positions = [[0,4], [7,3]]

    positions.each do |position|
      color = position[0] == 0 ? :black : :white
      board[position] = Queen.new(color, position, board)
    end
    board
  end

  def king_setup(board)
    positions = [[0,3], [7,4]]

    positions.each do |position|
      color = position[0] == 0 ? :black : :white
      board[position] = King.new(color, position, board)
    end
    board
  end
end
