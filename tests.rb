require_relative 'person_repository'
class PersonRepositoryTest
  @repository
  def initialize
    @repository = PersonRepository.new
  end

  def test_create_adds_person_to_repository
    person = { name: 'John', inn: '1234567890' }
    @repository.create(person)
    assert_includes(@repository.read_all, person)
  end

  def test_create_does_not_add_duplicate_person
    person = { name: 'John', inn: '1234567890' }
    @repository.create(person)
    @repository.create(person)
    assert_equal(1, @repository.read_all.length)
  end

  def test_read_all_returns_all_persons
    person1 = { name: 'John', inn: '1234567890' }
    person2 = { name: 'Jane', inn: '0987654321' }
    @repository.create(person1)
    @repository.create(person2)
    assert_equal([person1, person2], @repository.read_all)
  end

  def test_read_by_inn_returns_person_with_specific_inn
    person = { name: 'John', inn: '1234567890' }
    @repository.create(person)
    assert_equal(person, @repository.read_by_inn('1234567890'))
  end

  def test_read_by_inn_returns_nil_if_person_not_found
    assert_nil(@repository.read_by_inn('1234567890'))
  end

  def test_update_updates_existing_person
    person = { name: 'John', inn: '1234567890' }
    updated_person = { name: 'John Smith' }
    @repository.create(person)
    @repository.update('1234567890', updated_person)
    assert_equal(updated_person[:name], @repository.read_by_inn('1234567890')[:name])
  end

  def test_update_does_not_update_nonexistent_person
    updated_person = { name: 'John Smith' }
    @repository.update('1234567890', updated_person)
    assert_nil(@repository.read_by_inn('1234567890'))
  end

  def test_delete_removes_person_from_repository
    person = { name: 'John', inn: '1234567890' }
    @repository.create(person)
    @repository.delete('1234567890')
    assert_empty(@repository.read_all)
  end

  def test_find_by_criteria_returns_matching_persons
    person1 = { name: 'John', age: 30, inn: 'AF1234567890' }
    person2 = { name: 'Jane', age: 25, inn: 'AF1234567891' }
    person3 = { name: 'Jake', age: 30, inn: 'AF1234567892' }
    @repository.create(person1)
    @repository.create(person2)
    @repository.create(person3)
    criteria = { age: 30 }
    assert_equal([person1, person3], @repository.find_by_criteria(criteria))
  end

  def test_find_by_criteria_returns_empty_array_if_no_match
    criteria = { age: 30 }
    assert_empty(@repository.find_by_criteria(criteria))
  end

  private

  def assert_equal(expected, actual)
    raise 'Test failed' unless expected == actual
  end

  def assert_includes(collection, element)
    raise 'Test failed' unless collection.include?(element)
  end

  def assert_empty(collection)
    raise 'Test failed' unless collection.empty?
  end

  def assert_nil(value)
    raise 'Test failed' unless value.nil?
  end
end


PersonRepositoryTest.new.test_create_adds_person_to_repository
PersonRepositoryTest.new.test_create_does_not_add_duplicate_person
PersonRepositoryTest.new.test_read_all_returns_all_persons
PersonRepositoryTest.new.test_read_by_inn_returns_person_with_specific_inn
PersonRepositoryTest.new.test_read_by_inn_returns_nil_if_person_not_found
PersonRepositoryTest.new.test_update_updates_existing_person
PersonRepositoryTest.new.test_update_does_not_update_nonexistent_person
PersonRepositoryTest.new.test_delete_removes_person_from_repository
PersonRepositoryTest.new.test_find_by_criteria_returns_matching_persons
PersonRepositoryTest.new.test_find_by_criteria_returns_empty_array_if_no_match
