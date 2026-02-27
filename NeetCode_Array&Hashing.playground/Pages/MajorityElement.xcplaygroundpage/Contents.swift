
/*
 169. Majority Element
 Easy

 Topics
 premium lock icon
 Companies
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

  

 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2
  

 Constraints:

 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109
 The input is generated such that a majority element will exist in the array.
  

 Follow-up: Could you solve the problem in linear time and in O(1) space?
 */

import XCTest

class Solution {
    func majorityElement(_ arr: [Int]) -> Int {
        var element = 0
        var count = 0
        for num in arr {
            if count == 0 {
                element = num
            }
            count += element == num ? 1: -1
        }
        return element
    }
}

class SolutionTests: XCTestCase {
    func testSolution() {
        XCTAssertEqual(Solution().majorityElement([2,3,3,3,5]), 3)
        XCTAssertEqual(Solution().majorityElement([3,2,3,3,5]), 3)
    }
}

SolutionTests.defaultTestSuite.run()
