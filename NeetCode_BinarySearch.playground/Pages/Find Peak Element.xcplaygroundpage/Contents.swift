func findPeakElement(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }
    var left = 0
    var right = nums.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if mid > 0 && nums[mid] < nums[mid - 1] {
            right = mid - 1
        } else if mid < nums.count - 1 && nums[mid] < nums[mid + 1] {
            left = mid + 1
        } else {
            return mid
        }
    }
    return 0
}
//let nums = [1,2,3,1]
let nums = [1,2,1,3,5,6,4]
//let nums = [1]
//let nums = [1,2,3]
findPeakElement(nums)
