# frozen_string_literal: true

require_relative './hanoi_tower'

print('Enter the number of disks: ')
number_of_disks = gets.chomp.to_i
solver = HanoiTower.new(number_of_disks)
solver.solve
