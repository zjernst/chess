class Knight < Piece
  include SteppingMovement
  def initialize(color, current_pos, board)
    super
    @deltas = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
  end

  def to_s
    "Kn "
  end
end
