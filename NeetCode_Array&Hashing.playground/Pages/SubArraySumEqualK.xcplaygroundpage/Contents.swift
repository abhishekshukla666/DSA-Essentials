
/*
 
 Given an array of integers nums and an integer k, return the total number of 
 subarrays whose sum equals to k.

 A subarray is a contiguous non-empty sequence of elements within an array.

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2
 
 */

func subarraySum_BF(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    
    var cumulativeSum = Array(repeating: 0, count: nums.count + 1)
    cumulativeSum[0] = 0
    
    for index in stride(from: 1, through: nums.count, by : 1) {
        cumulativeSum[index] = cumulativeSum[index - 1] + nums[index - 1]
    }
    print(cumulativeSum)
    
    for start in 0..<nums.count {
        for end in start + 1...nums.count {
            if cumulativeSum[end] - cumulativeSum[start] == k {
                count += 1
            }
        }
    }
    
    return count
}

subarraySum_BF([-1,4,1,2,3,-6], 3)

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var map = [0:1]
    var currSum = 0
    var result = 0
    for n in nums {
        currSum += n
        let diff = currSum - k
        result += map[diff, default: 0]
        map[currSum, default: 0] += 1
    }
    return result
}

// Variation Two
func longestSubArraySumBetter(_ nums: [Int], _ k: Int) -> Int {
    var maxLength = 0
    var currSum = 0
    var map = [Int: Int]()
    
    for (i, n) in nums.enumerated() {
        currSum += n
        let diff = currSum - k
        if diff == 0 {
            maxLength = max(maxLength, i + 1)
        }
        if map[diff] != nil {
            maxLength = max(maxLength, i - map[diff]!)
        }
        if map[currSum] == nil {
            map[currSum] = i
        }
    }
    
    return maxLength
}

func longestSubArraySumOptimal(_ nums: [Int], _ k: Int) -> Int {
    
    var maxLength = 0
    var currSum = 0
    
    var i = 0; var j = 0
    
    while j < nums.count {
        currSum += nums[j]
        
        while currSum > k {
            currSum -= nums[i]
            i += 1
        }
        if currSum == k {
            maxLength = max(maxLength, j - i + 1)
        }
        
        j += 1
    }
    
    return maxLength
}

/* Sub-array Sum equals K */
//let nums = [1,1,1]; let k = 4
//let nums = [1,2,3]; let k = 3
//let nums = [1,2,1,2,1]; let k = 3
//subarraySum(nums, k)

/* Longest Sub-array Sum equals K */
//let nums = [1,2,3,1,1,1]; let k = 3
//let nums = [1,2,3,1,3]; let k = 2
//longestSubArraySumBetter(nums, k)
//longestSubArraySumOptimal(nums, k)

/*
 ------------------------------------------ Variation 3 --------------------------------------------------------
 */

/*
 Given an integer array nums and an integer k, return true if nums has a good subarray or false otherwise.

 A good subarray is a subarray where:

 its length is at least two, and
 the sum of the elements of the subarray is a multiple of k.
 Note that:

 A subarray is a contiguous part of the array.
 An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.
  

 Example 1:

 Input: nums = [23,2,4,6,7], k = 6
 Output: true
 Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
 Example 2:

 Input: nums = [23,2,6,4,7], k = 6
 Output: true
 Explanation: [23, 2, 6, 4, 7] is an continuous subarray of size 5 whose elements sum up to 42.
 42 is a multiple of 6 because 42 = 7 * 6 and 7 is an integer.
 Example 3:

 Input: nums = [23,2,6,4,7], k = 13
 Output: false
 */


func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    
    var dict = [0: -1]
    var currSum = 0
    for (i, n) in nums.enumerated() {
        currSum += n
        let reminder = currSum % k
        if let value = dict[reminder], i - value > 1 {
            return true
        } else {
            dict[reminder, default: -1] = i
        }
        
    }
    return false
}
