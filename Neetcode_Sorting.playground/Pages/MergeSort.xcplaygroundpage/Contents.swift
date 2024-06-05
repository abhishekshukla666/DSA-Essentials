
func sort(_ arr: [Int]) -> [Int] {
    if arr.count < 2 { return arr }
    let mid = arr.count/2
    let left = sort(Array(arr[0..<mid]))
    let right = sort(Array(arr[mid..<arr.count]))
    return helper(left, right)
}

func helper(_ left: [Int], _ right: [Int]) -> [Int] {
    var sorted = [Int]()
    var left = left
    var right = right
    var i = 0
    var j = 0
    // left = [2,3], right = [1,4]
    while i < left.count && j < right.count {
        if left[i] < right[j] {
            sorted.append(left[i])
            i += 1
        } else {
            sorted.append(right[j])
            j += 1
        }
    }
    
    
    while i < left.count {
        sorted.append(left[i])
        i += 1
    }
    
    while j < right.count {
        sorted.append(right[j])
        j += 1
    }
    return sorted
}

sort([8,7,1,6,3,5,2,4])
