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
  

 Constraints:
 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

import XCTest

/* Brute Force */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {

        let nums = nums.sorted()
        guard nums.count >= 3 else { return [[]] }

        var result = [[Int]]()
        var i = 0

        while i < nums.count {
            var j = i + 1
            while j < nums.count {
                var k = j + 1
                while k < nums.count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        result.append([nums[i], nums[j], nums[k]])
                    }
                    k += 1
                    while k < nums.count, nums[k] == nums[k - 1] {
                        k += 1
                    }
                    
                }
                j += 1
                while j < nums.count, nums[j] == nums[j - 1] {
                    j += 1
                }
            }
            i += 1
            while i < nums.count, nums[i] == nums[i - 1] {
                i += 1
            }
        }

        return result
    }
}

/* Better */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // [-1,0,1,2,-1,-4] ---(sorted)---> [-4, -1, -1, 0, 1, 2]
        let nums = nums.sorted()
        guard nums.count >= 3 else { return [[]] }

        var result = [[Int]]()
        var i = 0

        while i < nums.count {
            var j = i + 1
            while j < nums.count {
                var k = j + 1
                while k < nums.count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        result.append([nums[i], nums[j], nums[k]])
                    }
                    k += 1
                    while k < nums.count, nums[k] == nums[k - 1] {
                        k += 1
                    }
                    
                }
                j += 1
                while j < nums.count, nums[j] == nums[j - 1] {
                    j += 1
                }
            }
            i += 1
            while i < nums.count, nums[i] == nums[i - 1] {
                i += 1
            }
        }

        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().threeSum([-1, 0, 1, 2, -1, -4]), [[-1, -1, 2], [-1, 0, 1]])
    }
}
