
require_relative '../poem.rb'

dictionary = File.readlines('words.txt').map(&:chomp).map(&:downcase)

WORDS = [
  'pod',
  'nod',
  'cat',
  'dent'
]

describe('Grid poetry') do
  WORDS.each do |word|
    it("finds a grid rhyme for #{word}") do
      grid = grid_poem(dictionary, word)

      puts grid.map { |chars| chars.join(' ') }.join("\n")

      expect(grid.first.join).to eq word

      words = grid.map(&:join) + grid.transpose.map(&:join)

      expect(dictionary).to include(*words)
    end
  end
end
