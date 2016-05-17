module Movement
  def moves
    moves = []
    DELTA.each do |delta|
      finished_moving = false
      next_pos = @current_pos.tuple_plus(delta)
      new_moves = []

      until finished_moving

        if board[next_pos].is_a?(NullPiece)
          new_moves << next_pos
          next_pos = delta.tuple_plus(new_moves.last)
        elsif enemy_piece?(board[next_pos])
          new_moves << next_pos
          finished_moving = true
        else
          finished_moving = true
        end

      end
      moves << new_moves
    end

  end

  def parse_move(next_pos, new_moves)
    if board[next_pos].is_a?(NullPiece)
      new_moves << next_pos
    elsif enemy_piece?(board[next_pos])
      new_moves << next_pos
      finished_moving = true
    else
      finished_moving = true
    end
  end
end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def enemy_piece?(pos)
    board[pos].color != color
  end

  def friendly_piece?
    board[pos].color == color
  end









class Array
  def tuple_plus(other_tuple)
    [self.first + other_tuple.first, self.last + other_tuple.last]
  end
end






# module HorizontalMove
#   def possible_moves
#     moves = []
#     (-7..7).each do |int|
#       next if int == 0
#       x, y = @current_pos
#       moves << [x + int, y]
#       moves << [x, int + y]
#     end
#     moves.select { |x,y| x.between?(0,7) && y.between?(0,7) }
#   end
#
#   def path(move_pos)
#     possible_moves.select do |pos|
#       pos[0].between?(@current_pos[0], move_pos[0]) &&
#       pos[1].between?(@current_pos[1], move_pos[1])
#     end
#   end
# end
#
#
#
# module DiagonalMove
#   def possible_moves
#     moves = []
#
#     (-7..7).each do |int|
#       next if int == 0
#       x, y = @current_pos
#       moves << [x - int, y - int]
#       moves << [x + int, y + int]
#       moves << [x + int, y - int]
#       moves << [x - int, y + int]
#     end
#     moves.select { |x,y| x.between?(0,7) && y.between?(0,7) }
#   end
#
#   def path(move_pos)
#     possible_moves.select do |pos|
#       pos[0].between?(@current_pos[0], move_pos[0]) &&
#       pos[1].between?(@current_pos[1], move_pos[1])
#     end
#   end
# end
