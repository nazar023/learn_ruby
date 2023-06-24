module Fixnum
end

class Integer
  extend Fixnum

  def in_words
    number = self
    length = number.to_s.length

    count = length / 3
    count += 1 unless length.remainder(3).zero?

    size = 1
    result = []

    count.times do
      local_num = (number % 1000).to_s
      number /= 1000

      if length == 1 && local_num == '0'
        result.unshift('zero')
        next
      end

      case size
      when 2 then result.unshift('thousand') if local_num != '0'
      when 3 then result.unshift('million') if local_num != '0'
      when 4 then result.unshift('billion') if local_num != '0'
      when 5 then result.unshift('trillion') if local_num != '0'
      end

      if local_num.to_s.length == 1
        result.unshift(ones(local_num.to_i))
      elsif local_num.to_s.length == 2
        result.unshift(tens(local_num.to_i))
      elsif local_num.chr == '0' && local_num[1] == '0'
        result.unshift(ones((local_num[2]).to_i))
      elsif local_num.chr == '0' || local_num.length == 2
        result.unshift(tens((local_num[1..2]).to_i))
      else
        result.unshift(hundreds(local_num.to_i))
      end

      size += 1
    end
    result.delete(nil) if result.include?(nil)
    result.join(' ')
  end

  def ones(number)
    case number
    when 0 then nil
    when 1 then 'one'
    when 2 then 'two'
    when 3 then 'three'
    when 4 then 'four'
    when 5 then 'five'
    when 6 then 'six'
    when 7 then 'seven'
    when 8 then 'eight'
    when 9 then 'nine'
    end
  end

  def tens(number)
    if number.to_s.chr == '1'
      tens_easy(number)
    elsif number.to_s.include?('0')
      twenty_plus_easy(number)
    elsif !number.to_s.include?('0')
      mixed_tens(number)
    end
  end

  def tens_easy(number)
    case number
    when 10 then 'ten'
    when 11 then 'eleven'
    when 12 then 'twelve'
    when 13 then 'thirteen'
    when 14 then 'fourteen'
    when 15 then 'fifteen'
    when 16 then 'sixteen'
    when 17 then 'seventeen'
    when 18 then 'eighteen'
    when 19 then 'nineteen'
    end
  end

  def twenty_plus_easy(number)
    case number
    when 20 then 'twenty'
    when 30 then 'thirty'
    when 40 then 'forty'
    when 50 then 'fifty'
    when 60 then 'sixty'
    when 70 then 'seventy'
    when 80 then 'eighty'
    when 90 then 'ninety'
    end
  end

  def mixed_tens(number)
    "#{twenty_plus_easy((number.to_s.chr+'0').to_i)} #{ones(number.to_s[1].to_i)}"
  end

  def hundreds(number)
    number_str = number.to_s
    if number.to_s[1] == '0' && number.to_s[2] != '0'
      "#{ones(number_str.chr.to_i)} hundred #{ones(number_str[2].to_i)}"
    elsif number.to_s[1] != '0'
      "#{ones(number_str.chr.to_i)} hundred #{tens(number_str[1..2].to_i)}"
    else
      "#{ones(number_str.chr.to_i)} hundred"
    end
  end


end


