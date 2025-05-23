
/*
 
 215. Kth Largest Element in an Array
 Medium

 Given an integer array nums and an integer k, return the kth largest element in the array.

 Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Can you solve it without sorting?

  

 Example 1:

 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 Example 2:

 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
  

 Constraints:

 1 <= k <= nums.length <= 105
 -104 <= nums[i] <= 104
 */

import XCTest

struct Heap<Element> {
    
    var elements : [Element]
    let priorityFunction : (Element, Element) -> Bool
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
        else { return parentIndex }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(
            of: highestPriorityIndex(
                of: parent, and: leftChildIndex(of: parent)),
            and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
        else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
}
extension Heap {
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index) // 1
        guard !isRoot(index), // 2
              isHigherPriority(at: index, than: parent) // 3
        else { return }
        swapElement(at: index, with: parent) // 4
        siftUp(elementAtIndex: parent) // 5
    }
    
    mutating func dequeue() -> Element? {
      guard !isEmpty // 1
        else { return nil }
      swapElement(at: 0, with: count - 1) // 2
      let element = elements.removeLast() // 3
      if !isEmpty { // 4
        siftDown(elementAtIndex: 0) // 5
      }
      return element // 6
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
      let childIndex = highestPriorityIndex(for: index) // 1
      if index == childIndex { // 2
        return
      }
      swapElement(at: index, with: childIndex) // 3
      siftDown(elementAtIndex: childIndex)
    }
}
class Solution {
    var minHeap = Heap(elements: [Int](), priorityFunction: <)
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        for num in nums {
            minHeap.enqueue(num)
            if minHeap.count > k {
                minHeap.dequeue()
            }
        }
        debugPrint(minHeap.elements)
        return minHeap.peek()!
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().findKthLargest([1,2,3,4,5], 3), 3)
        XCTAssertEqual(Solution().findKthLargest([3,2,1,5,6,4], 2), 5)
    }
}

SolutionTests.defaultTestSuite.run()
