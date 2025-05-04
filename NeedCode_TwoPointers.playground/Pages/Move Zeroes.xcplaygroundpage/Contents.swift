
/*
 283. Move Zeroes
 Solved
 Easy

 Topics
 Companies

 Hint
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

  

 Example 1:

 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:

 Input: nums = [0]
 Output: [0]
  

 Constraints:

 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
  

 Follow up: Could you minimize the total number of operations done?
 */

import XCTest

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var l = 0
        var r = 0
        while r < nums.count {
            if nums[r] != 0 {
                nums.swapAt(l, r)
                l += 1
            }
            r += 1
        }
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        var nums = [0,1,0,3,12]
        Solution().moveZeroes(&nums)
        XCTAssertTrue(nums == [1,3,12,0,0])
    }
}

SolutionTests.defaultTestSuite.run()
