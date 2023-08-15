# frozen_string_literal: true

LITTLE_WORDS = %w[and over the].freeze

def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, times=1)
  return "#{word} #{word}" if times == 1

  arr = []
  times.times do
    arr << word
  end
  arr.join(' ')
end

def start_of_word(word, letter)
  return word.chr if letter == 1

  word[0...letter]
end

def first_word(string)
  string.split(' ').first
end

def titleize(string)
  arr = string.split(' ')
  arr.map do |word|
    word[0] = word[0].upcase unless LITTLE_WORDS.include?(word) && arr.first != word
    word
  end.join(' ')
end
