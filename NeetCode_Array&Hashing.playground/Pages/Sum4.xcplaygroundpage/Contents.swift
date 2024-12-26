

/*
 
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

  

 Example 1:

 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 Example 2:

 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]
 
 */

import XCTest

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var arr = nums
        let nums = arr.sorted()
        var result = [[Int]]()
        var quad = [Int]()
        func kSum(_ k: Int, _ start: Int, _ target: Int) {
            if k != 2 {
                for i in start..<nums.count {
                    if i > start && nums[i] == nums[i-1] { continue }
                    quad.append(nums[i])
                    kSum(k-1, i+1, target - nums[i])
                    quad.removeLast()
                }
                return
            }
            /* Base case - 2 Sum */
            var left = start
            var right = nums.count - 1
            while left < right {
                if nums[left] + nums[right] < target {
                    left += 1
                } else if nums[left] + nums[right] > target {
                    right -= 1
                } else {
                    var newQuad = quad
                    newQuad.append(nums[left])
                    newQuad.append(nums[right])
                    result.append(newQuad)
                    left += 1
                    while left < right && nums[left] == nums[left-1] {
                        left += 1
                    }
                }
            }
        }
        kSum(4, 0, target)
        debugPrint(result)
        return result
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    func testExample() {
        XCTAssertEqual(solution.fourSum([1,0,-1,0,-2,2], 0), [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]])
        XCTAssertEqual(solution.fourSum([2,2,2,2,2], 8), [[2,2,2,2]])
    }
}

SolutionTests.defaultTestSuite.run()
