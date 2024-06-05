
func rearrangeArray(_ nums: [Int]) -> [Int] {
    var arr = Array(repeating: -1, count: nums.count)
    
    var pos = 0
    var neg = 1
    
    for n in nums {
        if n > 0 {
            arr[pos] = n
            pos += 2
        } else {
            arr[neg] = n
            neg += 2
        }
    }
    return arr
}

let nums = [3,1,-2,-5,2,-4]
//let nums = [28,-41,22,-8,-37,46,35,-9,18,-6,19,-26,-37,-10,-9,15,14,31]
//let nums = [-37,-10,-9,15,14,31]
rearrangeArray(nums)
