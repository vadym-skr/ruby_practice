# frozen_string_literal: true

class Person
  include Regex

  attr_reader :first_name, :last_name, :inn, :birth_date

  def initialize(first_name, last_name, inn, birth_date)
    set_first_name(first_name)
    set_last_name(last_name)
    set_inn(inn)
    set_birth_date(birth_date)
  end

  def first_name=(new_first_name)
    set_first_name(new_first_name)
  end

  def last_name=(new_last_name)
    set_last_name(new_last_name)
  end

  def inn=(new_inn)
    set_inn(new_inn)
  end

  def birth_date=(new_birth_date)
    set_birth_date(new_birth_date)
  end

  private

  def set_first_name(first_name)
    if first_name.match(Regex.NAME)
      @first_name = first_name
    else
      raise "This name is not valid!"
    end
  end

  def set_last_name(last_name)
    if last_name.match(Regex.NAME)
      @last_name = last_name
    else
      raise "This surname is not valid!"
    end
  end

  def set_inn(inn)
    if inn.match(Regex.INN)
      @inn = inn
    else
      raise "This INN is not valid!"
    end
  end

  def set_birth_date(birth_date)
    if birth_date.match(Regex.DATE)
      if Date.parse(birth_date) < Date.today
        @birth_date = birth_date
      else
        raise "You are probably from future, try again on the written day!"
      end
    else
      raise "This date is not valid!"
    end
  end

end
