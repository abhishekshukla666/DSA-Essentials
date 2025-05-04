

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    var quad = [Int]()
    func kSum(_ k: Int, _ start: Int, _ target: Int) {
        if k != 2 {
            for i in start..<nums.count {
                if i > start && nums[i] == nums[i-1] { continue }
                quad.append(nums[i])
                kSum(k-1, i+1, target - nums[i])
                quad.removeLast()
            }
        }
        /* Base case - 2 Sum */
        var left = start
        var right = nums.count - 1
        while left < right {
            if nums[left] + nums[right] - target < 0 {
                left += 1
            } else if nums[left] + nums[right] - target > 0 {
                right -= 1
            } else {
                var newQuad = quad
                newQuad.append(nums[left])
                newQuad.append(nums[right])
                result.append(newQuad)
                while left < right && nums[left] == nums[left-1] {
                    left += 1
                }
            }
        }
    }
    kSum(4, 0, 0)
    return result
}

let nums = [1,0,-1,0,-2,2], target = 0
fourSum(nums, target)
