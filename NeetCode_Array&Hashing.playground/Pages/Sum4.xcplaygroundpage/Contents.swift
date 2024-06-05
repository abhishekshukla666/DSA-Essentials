
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    
    var quad = [Int]()
    func kSum(_ start: Int, _ k: Int, _ target: Int) {
        if k != 2 {
            for i in start..<nums.count {
                quad.append(nums[i])
                kSum(i + 1, k - 1, target - nums[i])
                quad.removeLast()
            }
            return
        }
        
        var left = start
        var right = nums.count - 1
        while left < right {
            if nums[left] + nums[right] < target {
                left += 1
            } else if nums[left] + nums[right] > target {
                right -= 1
            } else {
                var newQuad = quad
                newQuad.append(nums[left])
                newQuad.append(nums[right])
                result.append(newQuad)
                left += 1
                while left < right && nums[left] == nums[left-1] {
                    left += 1
                }
            }
        }
    }
    kSum(0, 4, target)
    return result
}


let nums = [1,0,-1,0,-2,2]; let target = 0
debugPrint(fourSum(nums, target))
