require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    
  attr_accessor :board, :current_player, :player_one, :player_two

  def initialize(player_one, player_two)
      @player_one = player_one
      @player_two = player_two
      @board = Board.new
      @current_player = player_one
      
  end

  def switch_players!
    case @current_player
      when @player_one then @current_player = @player_two
      when @player_two then @current_player = @player_one
    end
      
  end

  def play_turn
    move = current_player.get_move
    mark = current_player.mark
    board.place_mark(move, mark)
    switch_players!
    current_player.display(board)

  end
    
  def play
    until board.over?
      play_turn
    end
    
    puts "#{board.winner} is the winner!"
  end

end

player_one = HumanPlayer.new("Josh")
player_two = ComputerPlayer.new("comp")
new_game = Game.new(player_one, player_two)
new_game.play
