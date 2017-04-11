require 'set'
require 'pry'

# A grid poem is a poem where each row and column form a valid word
#
# eg:
#   p o d
#   a l e
#   d e w

# Write a method that takes a dictionary and a dictionary word
#
#  grid_poem(dictionary, "pod")
#
# [
#   "pod",
#   "ale",
#   "dew"
# ]
#


def grid_poem(dictionary, word)
  word_length = word.length
  characters = word.split('')

  words_of_length = Set.new(dictionary.select { |w| w.length == word_length }.map { |a| a.split('') })

  possible_solutions = words_of_length.to_a.permutation(word_length - 1)

  i = 0
  result = possible_solutions.find do |solution|
    grid = [characters] + solution

    words = grid.map(&:join) + grid.transpose.map(&:join)

    all_unique = words.uniq.length == words.length
    all_valid = words.all? { |w| words_of_length.include? w.split('') }

    i += 1
    if i % 10000 == 0
      p i
    end

    all_unique && all_valid
  end

  return nil if result.nil?

  [
    characters,
    *result
  ]
end

# given a word, like pod
# find two other words of the same length
#   where each of those words is awesome
#
# c a t
