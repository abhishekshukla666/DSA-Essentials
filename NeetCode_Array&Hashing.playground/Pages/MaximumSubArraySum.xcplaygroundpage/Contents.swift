
func maxSubArray(_ nums: [Int]) -> Int {
    var result = 0
    var sum = 0
    for i in 0..<nums.count {
        sum = max(nums[i], nums[i] + sum)
        result = max(sum, result);
    }
    return result
}


let nums = [-2,1,-3,4,-1,2,1,-5,4]
//maxSubArray(nums)

let dict = ["a": 2, "b": 6, "c": 10]
let value = dict.reduce(0) { ($0 + $1.value) }
print(value)



