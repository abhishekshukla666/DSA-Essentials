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

import XCTest

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var subarraySum: [Int] = Array(repeating: 0, count: nums.count + 1)
        
        for i in 1...nums.count {
            subarraySum[i] = subarraySum[i - 1] + nums[i - 1]
        }
        
        print(subarraySum)
        var subarraySumCount = 0
        
        for start in 0..<nums.count {
            for end in start+1...nums.count {
                if subarraySum[end] - subarraySum[start] == k {
                    subarraySumCount += 1
                }
            }
        }
        
        return subarraySumCount
    }
    
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var dict: [Int: Int] = [0: 1]
        var sum = 0
        var count = 0
        
        for n in nums {
            sum += n
            let diff = sum - k
            count += dict[diff, default: 0]
            dict[sum, default: 0] += 1
        }
        
        return count
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
//        XCTAssertEqual(Solution().subarraySum([1, 1, 1], 2), 2)
        XCTAssertEqual(Solution().subarraySum2([1, 1, 1], 2), 2)
    }
}

SolutionTests.defaultTestSuite.run()
