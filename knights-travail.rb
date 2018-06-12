class KnightPathFinder
  MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ].freeze

  def self.valid_moves(pos)
    valid_moves = []
    cur_x, cur_y = pos
    MOVES.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) }
        valid_moves << new_pos
      end
    end
    valid_moves
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]

    build_move_tree
  end
end
