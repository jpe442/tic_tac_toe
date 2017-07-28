class ComputerPlayer
  
  attr_reader :board, :name
  attr_accessor :mark

  def initialize(name)
    @name = name
    @mark = :O
  end
    
  def display(board)
    # Should pass the board as an instance variable of the class so that get_move has access
    @board = board 
  end
    
  def get_move
    # Should return winning move if available, else act randomly
    # To choose winning move, iterate through potential grid spots and check if marked winner is triggered when marked. If not act random. To check, actually make the mark on an empty spot and check if winner. If winner, return position. If not reset to nil and continue iterating.
    # First iterate through potential empty spots...
    board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, idx|
          pos = [row_idx, idx]
          if board.empty?(pos)
            board.place_mark(pos, mark)
            if board.winner == mark
              board.place_mark(pos, nil)
              return pos
            else
              board.place_mark(pos, nil)
            end
          end
      end 
    end      

    # To act randomly, count potential moves, determine random from 1 through total count. Use the randomly determined move to make a mark.
    
    moves = board.grid.flatten.count { |el| el == nil}
    
    empties = []
    board.grid.each_with_index do |row, row_idx|
      board.grid.each_index do |idx|
        pos = [row_idx, idx]
        empties << pos if board.empty?(pos)
      end
    end
    
    move = rand(0..moves-1)
    empties[move]
      
  end
    
end
