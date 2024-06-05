
/*
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]

 */

func rotate(_ nums: inout [Int], _ k: Int) {
    let k = k % nums.count
    var temp = [Int]()
    for i in 0..<nums.count - k {
        temp.append(nums[i])
    }
    for i in nums.count - k..<nums.count {
        nums[i - (nums.count - k)] = nums[i]
    }
    for i in k..<nums.count {
        nums[i] = temp[i-k]
    }
}

func rotate2(_ nums: inout [Int], _ k: Int) {
    var k = k
    for n in nums {
        nums[k % nums.count] = n
        k += 1
    }
}

var nums = [1,2,3,4,5,6,7]; let k = 3
rotate2(&nums, k)
print(nums)
