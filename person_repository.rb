# frozen_string_literal: true

class PersonRepository
  def initialize
    @persons = []
  end

  def create(person)
    return if person_exists?(person[:inn])

    @persons << person
  end

  def read_all
    @persons
  end

  def read_by_inn(inn)
    @persons.find { |person| person[:inn] == inn }
  end

  def update(inn, updated_person)
    return unless person_exists?(inn)

    person = read_by_inn(inn)
    person.merge!(updated_person)
  end

  def delete(inn)
    @persons.reject! { |person| person[:inn] == inn }
  end

  # person = { name: "vadym" }
  def find_by_criteria(criteria)
    @persons.select do |person|
      criteria.all? { |key, value| person[key] == value }
    end
  end

  private

  def person_exists?(inn)
    @persons.any? { |person| person[:inn] == inn }
  end
end




