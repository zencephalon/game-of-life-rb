class Life
  attr_accessor :board

  def initialize(board_str)
    rows = board_str.split(',')
    @height = rows.size
    @width = rows[0].size
    @board = rows.map do |row_str|
      row_str.split('').map do |char|
        char == 'X'
      end
    end
  end

  def cell(y, x)
    if y < 0 || x < 0 || x >= @width || y >= @height
      return false
    end
    @board[y][x]
  end

  def neighbors(y, x)
    num_neighbors = 0
    (-1..1).each do |dy|
      (-1..1).each do |dx|
        if cell(y + dy, x + dx) && !(dy == 0 && dx == 0)
          num_neighbors += 1
        end
      end
    end
    num_neighbors
  end

  def next
    @board = (0...@height).map do |y|
      (0...@width).map do |x|
        n = neighbors(y, x)
        puts "At #{y},#{x} neighbors: #{n}"
        cell(y, x) ? (n == 2 || n == 3) : n == 3
      end
    end
  end

  def to_s
    @board.map do |row|
      row.map do |val|
        val ? "X" : "."
      end.join('')
    end.join("\n")
  end
end


#l = Life.new("....,.XXX,....")
