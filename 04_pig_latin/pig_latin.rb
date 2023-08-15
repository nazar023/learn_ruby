# frozen_string_literal: true

VOWEL = %w[a e o i u].freeze

def translate(string)
  words = string.split(' ')

  words.map do |word|
    translate_word(word)
  end.join(' ')
end

def translate_word(word)
  i = index_of_vowel(word)
  "#{word[i..]}#{word[0...i]}ay"
end

def vowel?(letter)
  VOWEL.include?(letter)
end

def index_of_vowel(word)
  word.length.times do |i|
    next if i.positive? && word[i - 1] == 'q' && word[i] == 'u'

    return i if vowel?(word[i])
  end
  nil
end

