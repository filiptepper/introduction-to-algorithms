# http://en.wikipedia.org/wiki/Insertion_sort

class InsertionSort
  class << self
    def non_decreasing_sort array
      sort array, :>
    end

    def non_increasing_sort array
      sort array, :<
    end


    private


    def sort array, operator
      for i in 1..(array.length - 1) do
        key = array[i]
        j = i - 1

        while j > -1 && array[j].send(operator, key)
          array[j + 1] = array[j]
          j = j - 1
        end

        array[j + 1] = key
      end

      array
    end
  end
end

if $0 == __FILE__

  require "test/unit"

  class InsertionSortTest < Test::Unit::TestCase
    def test_insertion_sort_non_decreasing
      sorted_array = InsertionSort.non_decreasing_sort [9, 6, 3, 1, 2, 4, 8, 7, 5]
      assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], sorted_array
    end

    def test_insertion_sort_non_increasing
      sorted_array = InsertionSort.non_increasing_sort [9, 6, 3, 1, 2, 4, 8, 7, 5]
      assert_equal [9, 8, 7, 6, 5, 4, 3, 2, 1], sorted_array
    end
  end

end