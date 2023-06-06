func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    while left < right {
        let mid = (left + right) / 2
        if nums[mid] == target { return mid }
        else if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid - 1
        }
    }
    print(left, right)
    return left + 1
}

searchInsert([1,3,5,6], 2)
