class Game
  def self.play(board, human, computer)
    @symbols = ['X', 'O']
    @p1 = []
    @p2 = []
    @game_over = false

    board.draw_board
    while !@game_over
      human_move = human.move
      board.spaces[human_move] = get_symbol
      @p1 << human_move
      puts "#{@p1} \n"
      board.draw_board unless game_ova(board)
      break if @game_over
      computer_move = computer.move(board, @p1, @p2)
      board.spaces[computer_move] = get_symbol
      @p2 << computer_move
      puts "#{@p2} \n"
      board.draw_board unless game_ova(board)
    end
  end

  def self.get_symbol
   symbol = @symbols.shift
   @symbols << symbol
   return symbol
  end
  
  def self.game_ova(board)
    if board.winning_combo_found(@p1, @p2) == "human_winner"
      puts "human human wins"
      @game_over = true
    elsif board.winning_combo_found(@p1, @p2) == "computer_winner"
      puts "computer human wins"
      @game_over = true
    end
  end

end
