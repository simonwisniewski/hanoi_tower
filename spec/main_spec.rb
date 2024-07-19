# frozen_string_literal: true

require_relative '../hanoi_tower'

RSpec.describe HanoiTower do
  describe '#solve' do
    (1..20).each do |i|
      it "solves the puzzle with #{i} disks" do
        solver = described_class.new(i, rspec: true)
        result = solver.solve
        expect(result[0]).to eq(2**i - 1)
        expect(result[1][0].empty?).to be(true)
        expect(result[1][1].empty?).to be(true)
        expect(descending?(result[1][2])).to be(true)
      end
    end

    context 'with invalid inputs' do
      it 'raises an ArgumentError with negative input' do
        expect { described_class.new(-1) }.to raise_error(ArgumentError)
      end

      it 'raises an ArgumentError with zero input' do
        expect { described_class.new(0) }.to raise_error(ArgumentError)
      end

      it 'raises an ArgumentError with non-integer input' do
        expect { described_class.new('test') }.to raise_error(ArgumentError)
      end
    end
  end
end

def descending?(arr)
  arr.each_cons(2).all? { |a, b| a > b }
end
