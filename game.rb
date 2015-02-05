class Life
  attr_accessor :board

  def initialize(board_str)
    @board = board_str.split(',').map do |row_str|
      row_str.split('').map do |char|
        char == 'X'
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


#l = Life.new("....,.XX.,X..X")
