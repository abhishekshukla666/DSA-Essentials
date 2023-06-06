
func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    /*
    var left = [Int](repeating: 1, count: nums.count)
    var right = [Int](repeating: 1, count: nums.count)
    
    for i in 1..<nums.count {
        left[i] = left[i-1] * nums[i-1]
    }
    for i in stride(from: nums.count-2, to: -1, by: -1) {
        right[i] = right[i+1] * nums[i+1]
    }
    var result = [Int](repeating: 1, count: nums.count)
    for i in 0..<nums.count {
        result[i] = left[i] * right[i]
    }
    return result
     */
    
    var result = [Int](repeating: 1, count: nums.count)
    
    var prefix = 1
    for i in 1..<nums.count {
        prefix *= nums[i-1]
        result[i] = prefix
    }
    var postfix = 1
    for i in stride(from: nums.count - 2, to: -1, by: -1) {
        postfix *= nums[i+1]
        result[i] *= postfix
    }
    return result
}

productExceptSelf([2,1,4,3])


