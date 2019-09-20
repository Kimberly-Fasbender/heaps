# This method uses a heap to sort an array.
# Time Complexity:  O(n log n) - where n is the number of heap nodes in the list
# Space Complexity: O(1) - constant
def heapsort(list)
  return list if list.empty? || list.length == 1

  minHeap = MinHeap.new()

  until list.empty?
    minHeap.add(list.pop)
  end

  until minHeap.empty?
    list << minHeap.remove
  end

  return list
end
