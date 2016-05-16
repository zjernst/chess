require_relative 'pieces'
require_relative 'display'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) {NullPiece.new}}
  end

  def move(start, end_pos)
  #   prompt
  #   self[start].valid_move?
  # rescue RuntimeError => e
  #   e.message
  #   retry
    self[end_pos], self[start] = self[start], NullPiece.new
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  def rows
    @grid
  end
end
