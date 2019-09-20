class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n) - where n is the number of heap nodes
  # Space Complexity: O(1) - constant
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n) - where n is the number of heap nodes
  # Space Complexity: O(1) - constant
  def remove()
    swap(0, @store.length - 1)
    removed = @store.pop
    heap_down(0)
    return removed.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1) - I assume Ruby is just checking the first index of the array and checking if it's nil or not
  # Space complexity: O(1) - constant
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) - where n is the number of heap nodes
  # Space complexity: O(mn) - where m is the space the recursive call is taking up on the stack, and n is the max depth of the tree
  def heap_up(index)
    parent_index = (index - 1) / 2

    if @store[parent_index].key > @store[index].key && parent_index >= 0
      swap(parent_index, index)
      heap_up(parent_index)
    else
      return
    end
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # Time complexity: O(log n) - where n is the number of heap nodes
  # Space complexity: O(mn) - where m is the space the recursive call is taking up on the stack, and n is the max depth of the tree
  def heap_down(index)
    left_child_index = index * 2 + 1
    right_child_index = index * 2 + 2

    if @store[left_child_index].nil?
      return
    elsif @store[right_child_index].nil? || @store[left_child_index].key < @store[right_child_index].key
      swap(index, left_child_index)
      heap_down(left_child_index)
    else
      swap(index, right_child_index)
      heap_down(right_child_index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
