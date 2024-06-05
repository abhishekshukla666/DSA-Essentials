
func threeSum(_ arrs: [Int]) -> [[Int]] {
    var arr = arrs
    let nums = arr.sorted()
    var i = 0
    var result = [[Int]]()
    while i < nums.count {
        while i < nums.count && i > 0 && nums[i] == nums[i-1] {
            i += 1
            continue
        }
        
        var j = i + 1
        var k = nums.count - 1
        
        while j < k {
            let sum = nums[i] + nums[j] + nums[k]
            if sum < 0 {
                j += 1
            } else if sum == 0 {
                result.append([nums[i], nums[j], nums[k]])
                j += 1
                while j < k && nums[j] == nums[j-1] {
                    j += 1
                    continue
                }
            } else if sum > 0 {
                k -= 1
            }
        }
        
        i += 1
    }
    return result
}

let nums = [-1,0,1,2,-1,-4]
//let nums = [0,1,1]
//let nums = [0,0,0]
print(threeSum(nums))
