
require_relative '../poem.rb'

dictionary = File.readlines('words.txt').map(&:chomp).map(&:downcase)

WORDS = [
  'pod',
  'nod',
  'cat'
]

describe('Grid poetry') do
  WORDS.each do |word|
    it("finds a grid rhyme for #{word}") do
      words = grid_poem(dictionary, word)

      puts words

      expect(words.first).to eq word

      words.each do |word|
        expect(dictionary).to include word
      end

      rotated_words = words
        .map { |w| w.split('') }
        .transpose
        .map { |w| w.join }

      rotated_words.each do |word|
        expect(dictionary).to include word
      end
    end
  end
end
