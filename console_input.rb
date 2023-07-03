# frozen_string_literal: true

require 'regex'

module ConsoleInput
  def input_string
    input = nil
    first_time = true
    until input && input.match?(Regex.STRING)
      print first_time ?
        "Write any word: " : "It is not a word! try again: "
      input = gets.chomp
      first_time = false
    end
    input
  end

  def input_name
    input = nil
    first_time = true
    until input && input.match?(Regex.NAME)
      print first_time ?
              "Write name: " : "It is not a name! try again: "
      input = gets.chomp
      first_time = false
    end
    input
  end

  def input_number
    input = nil
    first_time = true
    until input && input.match?(Regex.NUMBER)
      print first_time ?
              "Write number (max 10^10): " : "It is not a number! try again: "
      input = gets.chomp
      first_time = false
    end
    input.to_i
  end

  def input_inn
    input = nil
    first_time = true
    until input && input.match?(Regex.INN)
      print first_time ?
              "Write inn: " : "It is not an inn! try again: "
      input = gets.chomp
      first_time = false
    end
    input
  end

  def input_date
    input = nil
    first_time = true
    until input && input.match?(Regex.DATE)
      print first_time ?
              "Write date (dd-mm-yyyy): " : "This date is incorrect! try again: "
      input = gets.chomp
      first_time = false
    end
    input
  end
end
