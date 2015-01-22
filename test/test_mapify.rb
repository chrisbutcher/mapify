require 'minitest/autorun'
require 'ostruct'
require 'mapify'

class MapifyTest < Minitest::Test
  def test_mapify_outputs_arrays_of_arrays_populated_with_objects_attributes_specified_by_symbols
    object_1 = OpenStruct.new(name: 'Alice', occupation: 'Baker')
    object_2 = OpenStruct.new(name: 'Bob', occupation: 'Farmer')
    array = [object_1, object_2]
    assert_equal [['Alice', 'Baker'], ['Bob', 'Farmer']], array.mapify(:name, :occupation)
  end

  def test_mapify_raises_argument_error_given_no_args
    assert_raises ArgumentError do
      [].mapify
    end
  end

  def test_mapify_raises_argument_error_when_given_any_non_symbol_params
    object_1 = OpenStruct.new(name: 'Alice', occupation: 'Baker')
    object_2 = OpenStruct.new(name: 'Bob', occupation: 'Farmer')
    array = [object_1, object_2]
    assert_raises ArgumentError do
      array.mapify(:name, 'occupation')
    end
  end

  def test_hashify_outputs_arrays_of_hashes_populated_with_objects_attributes_specified_by_symbols
    object_1 = OpenStruct.new(name: 'Alice', occupation: 'Baker')
    object_2 = OpenStruct.new(name: 'Bob', occupation: 'Farmer')
    array = [object_1, object_2]
    assert_equal [{name: 'Alice', occupation: 'Baker'}, {name: 'Bob', occupation: 'Farmer'}], array.hashify(:name, :occupation)
  end

  def test_hashify_raises_argument_error_given_no_args
    assert_raises ArgumentError do
      [].hashify
    end
  end

  def test_hashify_raises_argument_error_when_given_any_non_symbol_params
    object_1 = OpenStruct.new(name: 'Alice', occupation: 'Baker')
    object_2 = OpenStruct.new(name: 'Bob', occupation: 'Farmer')
    array = [object_1, object_2]
    assert_raises ArgumentError do
      array.hashify(:name, 'occupation')
    end
  end
end
