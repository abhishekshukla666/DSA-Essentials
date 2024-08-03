

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
}

extension Heap {
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

var maxHeap = Heap(elements: [Int](), priorityFunction: >)
maxHeap.enqueue(3)
maxHeap.enqueue(2)
maxHeap.enqueue(5)
maxHeap.enqueue(4)
maxHeap.enqueue(1)
maxHeap.enqueue(7)
maxHeap.enqueue(6)
maxHeap.peek()
print(maxHeap.elements)

var maxHeapSort = [Any]()
maxHeap.elements.forEach { _ in
    maxHeapSort.append(maxHeap.dequeue() ?? -1)
}
print(maxHeapSort)

print("\n")

var minHeap = Heap(elements: [Int](), priorityFunction: <)
minHeap.enqueue(3)
minHeap.enqueue(2)
minHeap.enqueue(5)
minHeap.enqueue(4)
minHeap.enqueue(1)
minHeap.enqueue(7)
minHeap.enqueue(6)
minHeap.peek()
print(minHeap.elements)

var minHeapSort = [Any]()
minHeap.elements.forEach { _ in
    minHeapSort.append(minHeap.dequeue() ?? -1)
}
print(minHeapSort)
