require "colorize"
require_relative "cursorable"
require_relative 'board'

class Display
  include Cursorable

  attr_reader :board

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def move
    next_move = []
    @selected = nil

    until next_move.compact.size == 2
      render

      next_move << get_input
      @selected = next_move.last unless next_move.last.nil?
    end
    proposed_move = next_move.compact!

    board.move(*next_move.compact) if board.valid_move?(*proposed_move)
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos || [i, j] == @selected
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end
end
