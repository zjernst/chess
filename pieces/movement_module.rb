module HorizontalMove
  def possible_moves
    moves = []
    (-7..7).each do |int|
      next if int == 0
      x, y = @current_pos
      moves << [x + int, y]
      moves << [x, int + y]
    end
    moves.select { |x,y| x.between?(0,7) && y.between?(0,7) }
  end

  def path(move_pos)
    possible_moves.select do |pos|
      pos[0].between?(@current_pos[0], move_pos[0]) &&
      pos[1].between?(@current_pos[1], move_pos[1])
    end
  end
end

module DiagonalMove
  def possible_moves
    moves = []

    (-7..7).each do |int|
      next if int == 0
      x, y = @current_pos
      moves << [x - int, y - int]
      moves << [x + int, y + int]
      moves << [x + int, y - int]
      moves << [x - int, y + int]
    end
    moves.select { |x,y| x.between?(0,7) && y.between?(0,7) }
  end

  def path(move_pos)
    possible_moves.select do |pos|
      pos[0].between?(@current_pos[0], move_pos[0]) &&
      pos[1].between?(@current_pos[1], move_pos[1])
    end
  end
end
