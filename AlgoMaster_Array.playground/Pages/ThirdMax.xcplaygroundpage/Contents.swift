
/*
 414. Third Maximum Number
 Easy

 Topics
 premium lock icon
 Companies
 Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.

  

 Example 1:

 Input: nums = [3,2,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2.
 The third distinct maximum is 1.
 Example 2:

 Input: nums = [1,2]
 Output: 2
 Explanation:
 The first distinct maximum is 2.
 The second distinct maximum is 1.
 The third distinct maximum does not exist, so the maximum (2) is returned instead.
 Example 3:

 Input: nums = [2,2,3,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2 (both 2's are counted together since they have the same value).
 The third distinct maximum is 1.
  

 Constraints:

 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
  

 Follow up: Can you find an O(n) solution?
 */

import XCTest

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var fir = Int.min
        var sec = Int.min
        var thr = Int.min
        for n in nums {
            if n == fir || n == sec || n == thr { continue }
            if n > fir {
                thr = sec
                sec = fir
                fir = n
            } else if n > sec {
                thr = sec
                sec = n
            } else if n > thr {
                thr = n
            }
        }
        
        return thr == Int.min ? fir: thr
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().thirdMax([3,2,1]), 1)
    }
    func testExample2() {
        XCTAssertEqual(Solution().thirdMax([1,2]), 2)
    }
    func testExample3() {
        XCTAssertEqual(Solution().thirdMax([2,2,3,1]), 1)
    }
    func testExample4() {
        XCTAssertEqual(Solution().thirdMax([1]), 1)
    }
}

SolutionTests.defaultTestSuite.run()
