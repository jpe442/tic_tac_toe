class Board

  attr_reader :grid
    
  def initialize(grid= Array.new(3) { Array.new(3) })
    @grid = grid
  end
  
  def place_mark(pos, mark)
    # If the place is empty? this should update the grid instance so that the player's mark is at the indicie. Use the []= method.
    row = pos[0]
    col = pos[1]
    @grid[row][col] = mark
  end

  def empty?(pos)
    # This should return a boolean indicating whether the space is empty. Helper method for place_mark
    row = pos[0]
    col = pos[1]
    @grid[row][col] != :X && @grid[row][col] != :O
  end
    
  
    
  def winner
    # This should return the mark of the winning player if there is one. 
    rows = [@grid[0], @grid[1], @grid[2]]
    grid_trans = @grid.transpose
    cols = [grid_trans[0], grid_trans[1], grid_trans[2]]
    # row X win
    return :X if @grid[0].all? { |pos| pos == :X }
    return :X if @grid[1].all? { |pos| pos == :X }
    return :X if @grid[2].all? { |pos| pos == :X }
    # row O win
    return :O if @grid[0].all? { |pos| pos == :O }
    return :O if @grid[1].all? { |pos| pos == :O }
    return :O if @grid[2].all? { |pos| pos == :O }
    # column X win
    return :X if grid_trans[0].all? { |pos| pos == :X}
    return :X if grid_trans[1].all? { |pos| pos == :X}
    return :X if grid_trans[2].all? { |pos| pos == :X}
    # column O win
    return :O if grid_trans[0].all? { |pos| pos == :O}
    return :O if grid_trans[1].all? { |pos| pos == :O}
    return :O if grid_trans[2].all? { |pos| pos == :O}
    # left diagonal win
    return :X if @grid[0][0] == :X && @grid[1][1] == :X && @grid[2][2] == :X 
    return :O if @grid[0][0] == :O && @grid[1][1] == :O && @grid[2][2] == :O 
    # right diagonal win
    return :X if @grid[0][2] == :X && @grid[1][1] == :X && @grid[2][0] == :X
    rows = [@grid[0], @grid[1], @grid[2]]
    cats_game = !@grid[0].include?(nil) && !@grid[1].include?(nil) && !@grid[2].include?(nil)
    return "cat's game" if cats_game
  end 
    
  def over?
    # This returns a boolean indicating that the winning conditions have been satisfied.
    rows = [@grid[0], @grid[1], @grid[2]]
    cats_game = !@grid[0].include?(nil) && !@grid[1].include?(nil) && !@grid[2].include?(nil)
    return true if cats_game
    !winner.nil?
  end

end
