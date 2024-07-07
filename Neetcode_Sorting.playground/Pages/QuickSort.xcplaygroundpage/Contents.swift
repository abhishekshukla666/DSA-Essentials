
import Foundation

// Method 1
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }

    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }

    return quicksort(less) + equal + quicksort(greater)
}

// Method 2
func quickSort<T: Comparable>(_ array: inout [T], low: Int, high: Int, isOrdered: (T, T) -> Bool) -> [T] {
    if low < high {
        let i = partition(&array, low: low, high: high, isOrdered: isOrdered)
        quickSort(&array, low: low, high: i - 1, isOrdered: isOrdered)
        quickSort(&array, low: i + 1, high: high, isOrdered: isOrdered)
    }
    return array
}

func partition<T: Comparable>(_ array: inout [T], low: Int, high: Int, isOrdered: (T, T) -> Bool) -> Int {
    
    let pivot = array[high]
    var i = low
    for j in low..<high {
        if isOrdered(array[j], pivot) {
            array.swapAt(i, j)
            i += 1
        }
    }
    array.swapAt(i, high)
    return i
}

var unSortedArray = [6, 2, 4, 5, 7, 1, 9, 8, 10, 3]

/// Method 1
quicksort(unSortedArray)

/// Method 2
quickSort(&unSortedArray, low: 0, high: unSortedArray.count - 1, isOrdered: <)
