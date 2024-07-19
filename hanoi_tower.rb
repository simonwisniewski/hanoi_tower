# frozen_string_literal:true

##
# Solves the Hanoi Tower problem
class HanoiTower
  # Initializes the HanoiTower object
  #
  # @param number_of_disks [Integer] the number of disks
  #
  # @param rspec [Boolean] specifies if output should be suppressed for testing
  def initialize(number_of_disks, rspec: false)
    raise ArgumentError, 'Number of disks must be a integer' unless number_of_disks.is_a?(Integer)
    raise ArgumentError, 'Number of disks must be greater than 0' if number_of_disks <= 0

    @num = number_of_disks
    @left_rod = (1..number_of_disks).to_a.reverse
    @mid_rod = []
    @right_rod = []
    @move_count = 0
    @rspec = rspec
  end

  ##
  # Solves the Hanoi Tower problem
  #
  # @param number_of_disks [Integer] the number of disks to move
  #
  # @param left_rod [Array] the starting rod
  #
  # @param mid_rod [Array] the auxiliary rod
  #
  # @param right_rod [Array] the destination rod
  #
  # @return [Array] the final move count and state of the right rod
  def solve(number_of_disks: @num, left_rod: @left_rod, right_rod: @right_rod, mid_rod: @mid_rod)
    if number_of_disks == 1
      move_disk(left_rod, right_rod)
      display_towers unless @rspec
    else
      solve(number_of_disks: number_of_disks - 1, left_rod: left_rod, right_rod: mid_rod, mid_rod: right_rod)
      move_disk(left_rod, right_rod)
      display_towers unless @rspec
      solve(number_of_disks: number_of_disks - 1, left_rod: mid_rod, right_rod: right_rod, mid_rod: left_rod)
    end
    [@move_count, [@left_rod, @mid_rod, @right_rod]]
  end

  # Moves a disk from one rod to another
  #
  #
  # @param from [Array] the rod to move from
  #
  # @param to [Array] the rod to move to
  def move_disk(from, to)
    to.push(from.pop)
    @move_count += 1
  end

  # Displays the state of the rods and the number of moves
  def display_towers
    system 'clear'
    puts "L: #{@left_rod}"
    puts "M: #{@mid_rod}"
    puts "R: #{@right_rod}"
    puts "Moves: #{@move_count}"
    sleep 0.75
  end
end