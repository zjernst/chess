class Pawn < Piece

  attr_accessor :first_move

  def initialize(color, current_pos, board)
    super
    @deltas = {white: [-1, 0], black: [1, 0]}[color]

  end

  def moves
    moves = []
    move = @current_pos.tuple_plus(@deltas)


    attacks = [[0,1],[0,-1]]
    moves += attacks.map { |attack| attack.tuple_plus(move) }.select do |pos|
      enemy_piece?(pos)
    end

    if board.empty?(move)
      moves << move
      first = move.tuple_plus(@deltas)
      moves << first if @first_move && board.empty?(first)
    end
    moves
  end

  def to_s
    " P "
  end


end
