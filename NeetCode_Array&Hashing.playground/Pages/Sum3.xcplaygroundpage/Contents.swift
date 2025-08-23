
/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.

  

 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 Example 2:

 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 Example 3:

 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.

 
 */

import XCTest

class Solution {
    func threeSum(_ arrs: [Int]) -> [[Int]] {
        
        let nums = arrs.sorted()
        var i = 0
        
        var result = [[Int]]()
        while i < nums.count {
            while i < nums.count && i > 0 && nums[i] == nums[i-1] {
                i += 1
                continue
            }
            
            var j = i + 1
            var k = nums.count - 1
            
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum < 0 {
                    j += 1
                } else if sum == 0 {
                    result.append([nums[i], nums[j], nums[k]])
                    j += 1
                    while j < k && nums[j] == nums[j-1] {
                        j += 1
                        continue
                    }
                } else if sum > 0 {
                    k -= 1
                }
            }
            
            i += 1
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        XCTAssertEqual(solution.threeSum([-1, 0, 1, 2, -1, -4]), [[-1, 0, 1], [-1, -1, 2]])
    }
}

SolutionTests.defaultTestSuite.run()
