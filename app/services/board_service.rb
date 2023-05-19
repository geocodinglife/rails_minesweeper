class BoardService
  attr_accessor :board

  MAX_K = 9
  MIN_K = 0

  def initialize(width, height, mines)
    @mines = mines
    @width = width
    @height = height
    @board = Array.new(width) { Array.new(height, MIN_K) }
  end

  def generate_board
    return if cell_count < mines

    @mines_placed = 0
    @k = MIN_K

    while mines > mines_placed
      coord = Coord.new(rand(width), rand(height))
      next unless available_position(coord)

      place_mine(coord)
      @mines_placed += 1
      @k = mines_placed * MAX_K / cell_count
    end
  end

  def print_board
    board.each do |row|
      row.each do |value|
        print " #{value >= 10 ? value : " #{value}"} "
      end
      puts
    end
  end

  private

  attr_reader :mines, :width, :height
  attr_accessor :mines_placed, :k

  def cell_count
    width * height
  end

  def available_position(coord)
    x, y = coord.x, coord.y
    x.between?(0, width - 1) && y.between?(0, height - 1) && board[x][y] <= k
  end

  def place_mine(coord)
    x, y = coord.x, coord.y
    board[x][y] += MAX_K

    collateral_positions(x, y).each do |c|
      next unless valid_position?(c)

      board[c.x][c.y] += 1
    end
  end

  def valid_position?(coord)
    x, y = coord.x, coord.y
    x.between?(0, width - 1) && y.between?(0, height - 1)
  end

  def collateral_positions(x, y)
    [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1], [0, 1], [1, -1],
      [1, 0], [1, 1]
    ].map { |coords| Coord.new(x + coords[0], y + coords[1]) }
  end
end

class Coord
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end
