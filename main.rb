# frozen_string_literal: true

require_relative './hanoi_tower'

print('Enter the number of disks: ')
number_of_disks = Integer(gets.chomp) rescue false
solver = HanoiTower.new(number_of_disks)
solver.solve
