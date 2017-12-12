require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,i|
      next if i == 6 || i == 13
      4.times do
        cup << :stone
      end
    end

  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos == 0 || start_pos > 14

  end

  def make_move(start_pos, current_player_name)
    cups_arr = @cups[start_pos]
    @cups[start_pos] = []

    until cups_arr.empty?
      start_pos+=1
      if start_pos > 13
        start_pos = 0
      end
      if start_pos == 6
        @cups[6] << cups_arr.pop if current_player_name == @name1
      elsif start_pos == 13
        @cups[13] << cups_arr.pop if current_player_name == @name2
      else
        @cups[start_pos]  << cups_arr.pop
      end
    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count ==1
      :switch
    else
      ending_cup_idx
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
    side1 = @cups[1..5].all? { |e| e.empty? }

    side2 = @cups[7..12].all? { |e| e.empty? }

    if side1 == true || side2 == true
      return true
    else
      return false
    end
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[6].length < @cups[13].length
      return @name2
    else
      :draw
    end
  end
end
