
/*
 
 
 16. 3Sum Closest
 Medium

 Topics
 Companies
 Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

 Return the sum of the three integers.

 You may assume that each input would have exactly one solution.
  

 Example 1:

 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 Example 2:

 Input: nums = [0,0,0], target = 1
 Output: 0
 Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).
  

 Constraints:

 3 <= nums.length <= 500
 -1000 <= nums[i] <= 1000
 -104 <= target <= 104
 
 */


import XCTest

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var diff = Int.max
        var result = Int.max
        
        var i = 0
        while i < nums.count - 2 {
            var j = i + 1
            var k = nums.count - 1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum < target {
                    j += 1
                } else {
                    k -= 1
                }
                
                if abs(sum - target) < diff {
                    diff = abs(sum - target)
                    result = sum
                }
            }
            i += 1
        }
        
        return result
    }
}

class SolutionTest: XCTestCase {
    func testCase1() {
        XCTAssertEqual(Solution().threeSumClosest([-1,2,1,-4], 1), 2)
        XCTAssertEqual(Solution().threeSumClosest([0,0,0], 1), 0)
    }
}

SolutionTest.defaultTestSuite.run()
