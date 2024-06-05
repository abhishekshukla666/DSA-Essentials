
/*
 
 Given a circular integer array nums of length n, return the maximum possible sum of a non-empty subarray of nums.

 A circular array means the end of the array connects to the beginning of the array. Formally, the next element of nums[i] is nums[(i + 1) % n] and the previous element of nums[i] is nums[(i - 1 + n) % n].

 A subarray may only include each element of the fixed buffer nums at most once. Formally, for a subarray nums[i], nums[i + 1], ..., nums[j], there does not exist i <= k1, k2 <= j with k1 % n == k2 % n.

  

 Example 1:

 Input: nums = [1,-2,3,-2]
 Output: 3
 Explanation: Subarray [3] has maximum sum 3.
 Example 2:

 Input: nums = [5,-3,5]
 Output: 10
 Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10.
 Example 3:

 Input: nums = [-3,-2,-3]
 Output: -2
 Explanation: Subarray [-2] has maximum sum -2.
 
 */

func maxSubarraySumCircular(_ nums: [Int]) -> Int {
    
    let maxSum1 = maximumSubArraySum(nums)
    var minNums = [Int]()
    var totalSum = 0
    for n in nums {
        totalSum += n
        let temp = n * -1
        minNums.append(temp)
    }
    print(minNums, totalSum)
    let maxSum2 = maximumSubArraySum(minNums)
    let possibleMax = maxSum2 + totalSum
    if possibleMax <= 0 {
        return maxSum1
    }
    return max(possibleMax, maxSum1)
}

/* Kadane's Algorithm */
func maximumSubArraySum(_ nums: [Int]) -> Int {
    var maxSum = Int.min
    var currSum = 0
    for n in nums {
        currSum += n
        maxSum = max(maxSum, currSum)
        if currSum < 0 {
            currSum = 0
        }
    }
    print(maxSum)
    return maxSum
}

//let nums = [1,-2,3,-2]
//let nums = [5,-3,5]
let nums = [-3,-2,-3]

maxSubarraySumCircular(nums)
