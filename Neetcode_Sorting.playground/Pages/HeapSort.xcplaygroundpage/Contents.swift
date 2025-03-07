

func heapSort(_ array: inout [Int]) {
    let n = array.count

    // Step 1: Build Max Heap
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
        heapify(&array, n, i)
    }

    // Step 2: Extract elements one by one from heap
    for i in stride(from: n - 1, through: 1, by: -1) {
        array.swapAt(0, i)  // Move current root to end
        heapify(&array, i, 0)  // Heapify reduced heap
    }
}

func heapify(_ array: inout [Int], _ n: Int, _ i: Int) {
    var largest = i
    let left = 2 * i + 1
    let right = 2 * i + 2

    // If left child is larger than root
    if left < n && array[left] > array[largest] {
        largest = left
    }

    // If right child is larger than largest so far
    if right < n && array[right] > array[largest] {
        largest = right
    }

    // If largest is not root
    if largest != i {
        array.swapAt(i, largest)
        heapify(&array, n, largest)  // Recursively heapify affected subtree
    }
}

// Example Usage
var numbers = [9, 4, 7, 1, 3, 8, 5]
heapSort(&numbers)
print(numbers) // ✅ Output: [1, 3, 4, 5, 7, 8, 9]


