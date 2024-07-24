# frozen_string_literal: true

require_relative './hanoi_tower'

# Validates that the input is a positive integer
def valid_integer?(input)
  input.match?(/^\d+$/)
end

print('Enter the number of disks: ')
number_of_disks = gets.chomp
if !valid_integer?(number_of_disks)
  puts 'Error: Number of disks must be a positive integer.'
  exit(1)
end

solver = HanoiTower.new(number_of_disks.to_i)
solver.solve
