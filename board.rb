require_relative 'pieces/piece'
require_relative 'display'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) {NullPiece.instance}}
  end

  def valid_move?(start, endd)
    self[start].path(endd).all? { |pos| self[pos].empty? }
  end

  def move(start, end_pos)
  #   prompt
  #   self[start].valid_move?
  # rescue RuntimeError => e
  #   e.message
  #   retr
    if valid_move?(start, endd)
      self[end_pos], self[start] = self[start], NullPiece.new
      self[end_pos].current_pos = end_pos
    end

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

  def empty?(pos)
    self[pos].is_a?(NullPiece)
  end
end
