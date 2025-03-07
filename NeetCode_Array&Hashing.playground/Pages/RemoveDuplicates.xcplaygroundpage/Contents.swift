
//let arr = [3, 3, 2, 1, 1, 4, 5, 2, 4, 6].sorted()
let arr = [1,1,2,2,3]
/*
 1. use set
 2. use hashmap
 */
func removeDuplicates(_ arr: [Int]) -> [Int] {
    var result = arr
    var i = 0
    for j in 0..<arr.count {
        if result[i] != result[j] {
            i += 1
            result.swapAt(i, j)
        }
    }
    return result
}

print(removeDuplicates(arr))
