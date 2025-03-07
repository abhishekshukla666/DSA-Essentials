
let arr = [4, 5, 3, 1, 2]

func insertionSort(_ arr: [Int], by order: (Int, Int) -> Bool) -> [Int] {
    var sortedArray = arr
    guard sortedArray.count > 1 else { return sortedArray }
    
    for i in 1..<sortedArray.count {
        let key = sortedArray[i]
        var j = i
        while j > 0 && order(sortedArray[j - 1], key) {
            sortedArray[j] = sortedArray[j - 1]
            j -= 1
        }
        sortedArray[j] = key
    }
    
    return sortedArray
}

print(insertionSort(arr, by: >))
