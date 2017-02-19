
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

  words_of_length = dictionary.select { |w| w.length == word_length }

  possible_solutions = words_of_length.permutation(2)

  result = possible_solutions.find do |solution|
    grid = [
      characters,
      *solution.map { |w| w.split('') }
    ]

    grid.transpose.map { |characters| characters.join }
      .all? { |word| dictionary.include? word }
  end

  return nil if result.nil?

  [
    word,
    *result
  ]
end

# given a word, like pod
# find two other words of the same length
#   where each of those words is awesome
#
# c a t
