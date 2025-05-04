
/*
 189. Rotate Array
 Solved
 Medium

 Topics
 Companies

 Hint
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
  

 Constraints:

 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
  

 Follow up:

 Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 */
import XCTest

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n
        var result = [Int](repeating: -1, count: n)
        for (index, num) in nums.enumerated() {
            result[(k + index) % n] = num
            /*
             result[(3 + 0) % 7] = result[3] = 1
             result[(3 + 1) % 7] = result[4] = 2
             result[(3 + 2) % 7] = result[5] = 3
             result[(3 + 3) % 7] = result[6] = 4
             result[(3 + 4) % 7] = result[0] = 5
             result[(3 + 5) % 7] = result[1] = 6
             result[(3 + 6) % 7] = result[2] = 7
             
             
             */
        }
        nums = result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        var nums = [1,2,3,4,5,6,7]
        Solution().rotate(&nums, 3)
        XCTAssertEqual(nums, [5,6,7,1,2,3,4])
    }
}

SolutionTests.defaultTestSuite.run()
