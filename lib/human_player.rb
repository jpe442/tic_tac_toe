class HumanPlayer
  attr_accessor :name, :mark

  def initialize(name)
    @name = name
    @mark = :X
  end
    
  def display(board)
    # Should print out the board to the console
    p board.grid[0]
    p board.grid[1]
    p board.grid[2]
  end
    
  def get_move
    # Should allow the player to enter a move of the form '0,0' and return as a position of the form [0,0]
    puts "Please enter where you would like to move..."
    input = gets.chomp
    input.split(",").map {|el| el.to_i}
  end

end
