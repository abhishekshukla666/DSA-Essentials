
/*
 523. Continuous Subarray Sum
 Solved
 Medium

 Topics
 premium lock icon
 Companies
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
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109
 0 <= sum(nums[i]) <= 231 - 1
 1 <= k <= 231 - 1
 */

import XCTest

class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        
        for start in 0..<nums.count {
            var sum = 0
            for end in start..<nums.count {
                sum += nums[end]
                if end - start > 0 && sum % k == 0 { return true }
            }
        }
        return false
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().checkSubarraySum([23,2,6,4,7], 6), true)
    }
    func testExample2() {
        XCTAssertEqual(Solution().checkSubarraySum([23,2,4,6,7], 6), true)
    }
    func testExample3() {
        XCTAssertEqual(Solution().checkSubarraySum([23,2,6,4,7], 13), false)
    }
    func testExample4() {
        XCTAssertEqual(Solution().checkSubarraySum([23,2,4,6,6], 7), true)
    }
    func testExample5() {
        /* this testcase will not cover with prefix sum subarray */
        XCTAssertEqual(Solution().checkSubarraySum([5,0,0,0], 3), true)
    }
    func testExample6() {
        /* this testcase will not cover with prefix sum subarray */
        XCTAssertEqual(Solution().checkSubarraySum([0], 1), false)
    }
}

SolutionTests.defaultTestSuite.run()
