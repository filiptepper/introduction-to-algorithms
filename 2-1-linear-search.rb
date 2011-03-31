# http://en.wikipedia.org/wiki/Linear_search

class LinearSearch
  class << self
    def search value, array
      array.each_with_index do |item, i|
        return i if item.equal?(value)
      end

      nil
    end
  end
end

if $0 == __FILE__

  require "test/unit"

  class LinearSearchTest < Test::Unit::TestCase
    def test_linear_search_with_return_value
      value = LinearSearch.search 8, [9, 6, 3, 1, 2, 4, 8, 7, 5]
      assert_equal 6, value
    end

    def test_linear_search_with_nil_value
      value = LinearSearch.search 10, [9, 6, 3, 1, 2, 4, 8, 7, 5]
      assert_equal nil, value
    end
  end

end