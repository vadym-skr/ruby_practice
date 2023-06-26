require 'date'

module Validation
  def self.valid_name?(string)
    return false if string.length > 40

    pattern = /^[a-zA-Z]+-[a-zA-Z]+$/
    return pattern.match?(string)
  end

  def self.valid_inn?(string)
    pattern = /^[A-Z]{2}\d{10}$/
    return pattern.match?(string)
  end

  def self.after_date?(date)
    return date <= Date.today
  end
end

# Приклад використання функцій модуля
puts Validation.valid_name?("John-Doe")  # true
puts Validation.valid_name?("John Doe")  # false (немає дефісу)
puts Validation.valid_name?("VeryLongNameThatExceedsTheMaxLengthLimit")  # false (перевищена максимальна довжина)

puts Validation.valid_inn?("AB1234567890")  # true
puts Validation.valid_inn?("AB123")  # false (мало цифр)
puts Validation.valid_inn?("abc1234567890")  # false (формат не такий)

puts Validation.after_date?(Date.parse("1990-01-01"))  # true
puts Validation.after_date?(Date.today)  # true
puts Validation.after_date?(Date.parse("2200-01-01"))  # false (майбутня дата)