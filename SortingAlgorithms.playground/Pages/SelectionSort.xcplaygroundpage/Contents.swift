
let arr = [4, 2, 5, 1, 3]

func selectionSort(_ arr: [Int]) -> [Int] {
    var sortedArray = arr
    guard sortedArray.count > 1 else {
        return sortedArray
    }
    
    for i in 0..<sortedArray.count {
        var minIndex = i
        for j in i + 1..<sortedArray.count {
            if sortedArray[j] < sortedArray[minIndex] {
                minIndex = j
            }
        }
        sortedArray.swapAt(i, minIndex)
    }
    return sortedArray
}

print(selectionSort(arr))
