require_relative 'pieces/piece'
require_relative 'display'
require 'byebug'

class Board

  attr_accessor :grid

  def initialize(grid = nil)
    @grid = grid || Array.new(8) {Array.new(8) {NullPiece.instance}}
  end

  def valid_move?(start, endd)
    self[start].path(endd).all? { |pos| self[pos].empty? }
  end

  def check?(color)
    enemy = color == :white ? :black : :white

    (0..7).each do |x|
      (0..7).each do |y|
        pos = [x,y]

        piece = self[pos]
        if piece.color == enemy
          piece.moves.each { |move| return true if self[move].is_a?(King) }
        end

      end
    end
    false
  end

  def move(start, end_pos)
  #   prompt
  #   self[start].valid_move?
  # rescue RuntimeError => e
  #   e.message
  #   retr
    # if valid_move?(start, endd)
    self[end_pos], self[start] = self[start], NullPiece.instance
    self[end_pos].current_pos = end_pos
    # end

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

  def deep_dup
    duplicate = []

    @grid.each do |row|
      duplicate << row.dup
    end
    duplicate_board = Board.new(duplicate)

    duplicate_board.grid.map! do |row|
      row.map do |piece|
        if piece.is_a?(NullPiece)
          piece
        else
          color = piece.color
          pos = piece.current_pos
          piece.class.new(color, pos, duplicate_board)
        end
      end
    end
    duplicate_board

  end

  def check_mate?(color)

    (0..7).each do |x|
      (0..7).each do |y|

        pos = [x,y]
        piece = self[pos]
        next unless piece.color == color

        piece.moves.each do |pos|
          virtual_board = deep_dup
          debugger
          virtual_board.move(piece.current_pos, pos)
          return false unless virtual_board.check?(color)
        end
      end
    end
    true
  end

end
