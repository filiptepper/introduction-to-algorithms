# http://en.wikipedia.org/wiki/Selection_sort

class SelectionSort
  class << self
    def sort array
      0.upto(array.length - 2) do |i|
        value = i

        (i + 1).upto(array.length - 1) do |j|
          value = j if array[j] < array[value]
        end

        array[value], array[i] = array[i], array[value] if i != value
      end

      array
    end
  end
end

if $0 == __FILE__

  require "test/unit"

  class SelectionSortTest < Test::Unit::TestCase
    def test_sort
      sorted_array = SelectionSort.sort [9, 6, 3, 1, 2, 4, 8, 7, 5]
      assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], sorted_array
    end
  end

end