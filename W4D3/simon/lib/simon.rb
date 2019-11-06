class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over # while game is not over
      take_turn
    end
    game_over_message
    reset_game

    puts "Do you want to play again? (Yes or No)"
    ans = gets.chomp
    if ans.downcase == "yes"
      play
    end
  end

  def take_turn
    if !game_over
      show_sequence
      require_sequence
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    p seq.join(" ")
  end

  def require_sequence
    puts "\nRepeat what I said:"
    user_input = gets.chomp.split(" ")
    self.game_over = true if user_input.length != seq.length
    user_input.each_index do |i|
      self.game_over = true if user_input[i] != seq[i]
    end
  end

  def add_random_color
    rand_idx = rand(0...COLORS.length)
    seq << COLORS[rand_idx]
  end

  def round_success_message
    puts "You win this round!\n"
  end

  def game_over_message
    puts "Game over!\n"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

s = Simon.new
s.play