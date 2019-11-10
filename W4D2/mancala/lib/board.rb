class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = place_stones
    @cups[6] = []
    @cups[13] = []
    @players = {6 => name1, 13 => name2}
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos >= 14
      raise "Invalid starting cup"
    elsif cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player)
    new_pos = 0
    num_stones = cups[start_pos].length
    i = 1

    while i <= num_stones 
      new_pos = (start_pos + i) % 14
      if is_opponent?(new_pos, current_player)
        num_stones += 1
      else
        cups[new_pos] << :stone
      end
      i += 1
    end

    cups[start_pos] = []
    render
    next_turn(new_pos)
  end

  def is_opponent?(pos, current_player)
    if @players.has_key?(pos)
      if @players[pos] != current_player
        return true
      end
    end
    false
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0...6].all?(&:empty?) || cups[7...13].all?(&:empty?)
  end

  def winner
    if cups[6].length == cups[13].length
      return :draw
    elsif cups[6].length > cups[13].length
      return @players[6]
    else
      return @players[13]
    end
  end
end
